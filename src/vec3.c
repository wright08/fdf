#include "fdf.h"

t_vec3	*vec3(double x, double y, double z)
{
	t_vec3 *ret;

	ret = malloc(sizeof(*ret));
	ret->x = x;
	ret->y = y;
	ret->z = z;
	return (ret);
}

double	vec3_length(const t_vec3 *v)
{
	return (sqrt(v->x * v->x + v->y * v->y + v->z * v->z));
}

double	vec3_dot(const t_vec3 *a, const t_vec3 *b)
{
	return (a->x * b->x + a->y * b->y + a->z * b->z);
}

void	vec3_normalize(t_vec3 *v)
{
	double len;
	double inv_len;
	
	len = vec3_dot(v, v);
	if (len > 0)
	{
		inv_len = 1 / sqrt(len);
		v->x *= inv_len;
		v->y *= inv_len;
		v->z *= inv_len;
	}
}

t_vec3	*vec3_cross(const t_vec3 *a, const t_vec3 *b)
{
	t_vec3 *ret;

	ret = malloc(sizeof(*ret));
	ret->x = a->y * b->z - a->z * b->y;
	ret->y = a->z * b->x - a->x * b->z;
	ret->z = a->x * b->y - a->y * b->x;
	return (ret);
}