/*
 *	floats.c
 */

float	g_uninit;
float	g_init = 42.00;

int	main(void)
{
  float	local;

  local = 11.9;
  local += g_init;
  return (0);
}


