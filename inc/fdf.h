#ifndef FDF_H
# define FDF_H

# include "libft.h"
# include "math.h"

struct s_vec3
{
	double	x;
	double 	y;
	double 	z;
};
typedef struct s_vec3	t_vec3;

t_vec3	*vec3(double x, double y, double z);
double	vec3_dot(const t_vec3 *a, const t_vec3 *b);
double	vec3_length(const t_vec3 *v);
void	vec3_normalize(t_vec3 *v);

#endif
