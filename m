Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E9C10F297
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Dec 2019 23:02:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RfHJ51lBzDqKv
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Dec 2019 09:02:36 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=mfe@pengutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=pengutronix.de
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PhdR1J2mzDrBf
 for <linux-aspeed@lists.ozlabs.org>; Sat, 30 Nov 2019 04:41:31 +1100 (AEDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.lab.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1iak1U-0003DA-Mw; Fri, 29 Nov 2019 18:25:40 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1iak1S-0003AX-Mt; Fri, 29 Nov 2019 18:25:38 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: support.opensource@diasemi.com, lee.jones@linaro.org, robh+dt@kernel.org,
 linus.walleij@linaro.org, bgolaszewski@baylibre.com, joel@jms.id.au,
 andrew@aj.id.au, lgirdwood@gmail.com, broonie@kernel.org
Subject: [PATCH v3 4/6] regulator: da9062: add voltage selection gpio support
Date: Fri, 29 Nov 2019 18:25:35 +0100
Message-Id: <20191129172537.31410-5-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191129172537.31410-1-m.felsch@pengutronix.de>
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-aspeed@lists.ozlabs.org
X-Mailman-Approved-At: Tue, 03 Dec 2019 09:01:40 +1100
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The DA9062/1 devices can switch their regulator voltages between
voltage-A (active) and voltage-B (suspend) settings. Switching the
voltages can be controlled by ther internal state-machine or by a gpio
input signal and can be configured for each individual regulator. This
commit adds the gpio-based voltage switching support.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Changelog:
v3:
- make use of <linux/gpio/private.h>
- add comment to vsel_gpi
- append vsel_gpi to da9062_regulator_info instead of insert it in the
  middle

v2:
- use new public api gpiod_to_offset()
- add -ENOENT error check to mimic devm_gpio_optional
- add local gpio check for hardening the code
---
 drivers/regulator/da9062-regulator.c | 174 +++++++++++++++++++++++++++
 1 file changed, 174 insertions(+)

diff --git a/drivers/regulator/da9062-regulator.c b/drivers/regulator/da9062-regulator.c
index 710e67081d53..6117e631236b 100644
--- a/drivers/regulator/da9062-regulator.c
+++ b/drivers/regulator/da9062-regulator.c
@@ -7,6 +7,8 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/private.h>			/* for gpiod_to_offset() */
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -52,6 +54,16 @@ struct da9062_regulator_info {
 	unsigned int suspend_vsel_reg;
 	/* Event detection bit */
 	struct reg_field oc_event;
+	/*
+	 * The DA9062 can use its own general purpose inputs to control the
+	 * regulators. Each regulator can be configured independently. So the
+	 * DA9062 is a consumer of its own provided general purpose inputs.
+	 *
+	 * vsel_gpi:
+	 * The input port which is used by a regulator to select between
+	 * voltage-a/b settings.
+	 */
+	struct reg_field vsel_gpi;
 };
 
 /* Single regulator settings */
@@ -65,6 +77,7 @@ struct da9062_regulator {
 	struct regmap_field			*suspend;
 	struct regmap_field			*sleep;
 	struct regmap_field			*suspend_sleep;
+	struct regmap_field			*vsel_gpi;
 };
 
 /* Encapsulates all information for the regulators driver */
@@ -351,6 +364,81 @@ static const struct regulator_ops da9062_ldo_ops = {
 	.set_suspend_mode	= da9062_ldo_set_suspend_mode,
 };
 
+static int da9062_config_gpi(struct device_node *np,
+			     const struct regulator_desc *desc,
+			     struct regulator_config *cfg, const char *gpi_id)
+{
+	struct da9062_regulator *regl = cfg->driver_data;
+	struct device *hw = regl->hw->dev;
+	struct device_node *gpio_np;
+	struct gpio_desc *gpi;
+	unsigned int nr;
+	int ret;
+	char *prop, *label;
+
+	prop = kasprintf(GFP_KERNEL, "dlg,%s-sense-gpios", gpi_id);
+	if (!prop)
+		return -ENOMEM;
+
+	label = kasprintf(GFP_KERNEL, "%s-%s-gpi", desc->name, gpi_id);
+	if (!label) {
+		ret = -ENOMEM;
+		goto free;
+	}
+
+	/*
+	 * We only must ensure that the gpio device is probed before the
+	 * regulator driver so no need to store the reference global. Luckily
+	 * devm_* releases the gpio upon a remove action. The gpio's are
+	 * optional so we need to check for ENOENT. Also we need to check for
+	 * the GPIOLIB support. Do nothing if the property or the gpiolib is
+	 * missing.
+	 */
+	gpi = devm_gpiod_get_from_of_node(cfg->dev, np, prop, 0, GPIOD_IN |
+					  GPIOD_FLAGS_BIT_NONEXCLUSIVE, label);
+	if (IS_ERR(gpi)) {
+		ret = PTR_ERR(gpi);
+		if (ret == -ENOENT || ret == -ENOSYS)
+			ret = 0;
+		goto free;
+	}
+
+	/*
+	 * Only local gpios are valid. The gpio-controller is within the
+	 * mfd-root node.
+	 */
+	gpio_np = of_parse_phandle(np, prop, 0);
+	if (gpio_np != hw->of_node) {
+		of_node_put(gpio_np);
+		dev_err(hw, "Failed to request %s.\n", prop);
+		ret = -EINVAL;
+		goto free;
+	}
+	of_node_put(gpio_np);
+
+	/* We need the local number */
+	nr = gpiod_to_offset(gpi);
+	if (nr < 1 || nr > 3) {
+		ret = -EINVAL;
+		goto free;
+	}
+
+	ret = regmap_field_write(regl->vsel_gpi, nr);
+
+free:
+	kfree(prop);
+	kfree(label);
+
+	return ret;
+}
+
+static int da9062_parse_dt(struct device_node *np,
+			   const struct regulator_desc *desc,
+			   struct regulator_config *cfg)
+{
+	return da9062_config_gpi(np, desc, cfg, "vsel");
+}
+
 /* DA9061 Regulator information */
 static const struct da9062_regulator_info local_da9061_regulator_info[] = {
 	{
@@ -358,6 +446,7 @@ static const struct da9062_regulator_info local_da9061_regulator_info[] = {
 		.desc.name = "DA9061 BUCK1",
 		.desc.of_match = of_match_ptr("buck1"),
 		.desc.regulators_node = of_match_ptr("regulators"),
+		.desc.of_parse_cb = da9062_parse_dt,
 		.desc.ops = &da9062_buck_ops,
 		.desc.min_uV = (300) * 1000,
 		.desc.uV_step = (10) * 1000,
@@ -388,12 +477,17 @@ static const struct da9062_regulator_info local_da9061_regulator_info[] = {
 			__builtin_ffs((int)DA9062AA_BUCK1_CONF_MASK) - 1,
 			sizeof(unsigned int) * 8 -
 			__builtin_clz(DA9062AA_BUCK1_CONF_MASK) - 1),
+		.vsel_gpi = REG_FIELD(DA9062AA_BUCK1_CONT,
+			__builtin_ffs((int)DA9062AA_VBUCK1_GPI_MASK) - 1,
+			sizeof(unsigned int) * 8 -
+			__builtin_clz(DA9062AA_VBUCK1_GPI_MASK) - 1),
 	},
 	{
 		.desc.id = DA9061_ID_BUCK2,
 		.desc.name = "DA9061 BUCK2",
 		.desc.of_match = of_match_ptr("buck2"),
 		.desc.regulators_node = of_match_ptr("regulators"),
+		.desc.of_parse_cb = da9062_parse_dt,
 		.desc.ops = &da9062_buck_ops,
 		.desc.min_uV = (800) * 1000,
 		.desc.uV_step = (20) * 1000,
@@ -424,12 +518,17 @@ static const struct da9062_regulator_info local_da9061_regulator_info[] = {
 			__builtin_ffs((int)DA9062AA_BUCK3_CONF_MASK) - 1,
 			sizeof(unsigned int) * 8 -
 			__builtin_clz(DA9062AA_BUCK3_CONF_MASK) - 1),
+		.vsel_gpi = REG_FIELD(DA9062AA_BUCK3_CONT,
+			__builtin_ffs((int)DA9062AA_VBUCK3_GPI_MASK) - 1,
+			sizeof(unsigned int) * 8 -
+			__builtin_clz(DA9062AA_VBUCK3_GPI_MASK) - 1),
 	},
 	{
 		.desc.id = DA9061_ID_BUCK3,
 		.desc.name = "DA9061 BUCK3",
 		.desc.of_match = of_match_ptr("buck3"),
 		.desc.regulators_node = of_match_ptr("regulators"),
+		.desc.of_parse_cb = da9062_parse_dt,
 		.desc.ops = &da9062_buck_ops,
 		.desc.min_uV = (530) * 1000,
 		.desc.uV_step = (10) * 1000,
@@ -460,12 +559,17 @@ static const struct da9062_regulator_info local_da9061_regulator_info[] = {
 			__builtin_ffs((int)DA9062AA_BUCK4_CONF_MASK) - 1,
 			sizeof(unsigned int) * 8 -
 			__builtin_clz(DA9062AA_BUCK4_CONF_MASK) - 1),
+		.vsel_gpi = REG_FIELD(DA9062AA_BUCK4_CONT,
+			__builtin_ffs((int)DA9062AA_VBUCK4_GPI_MASK) - 1,
+			sizeof(unsigned int) * 8 -
+			__builtin_clz(DA9062AA_VBUCK4_GPI_MASK) - 1),
 	},
 	{
 		.desc.id = DA9061_ID_LDO1,
 		.desc.name = "DA9061 LDO1",
 		.desc.of_match = of_match_ptr("ldo1"),
 		.desc.regulators_node = of_match_ptr("regulators"),
+		.desc.of_parse_cb = da9062_parse_dt,
 		.desc.ops = &da9062_ldo_ops,
 		.desc.min_uV = (900) * 1000,
 		.desc.uV_step = (50) * 1000,
@@ -489,6 +593,10 @@ static const struct da9062_regulator_info local_da9061_regulator_info[] = {
 			__builtin_ffs((int)DA9062AA_LDO1_CONF_MASK) - 1,
 			sizeof(unsigned int) * 8 -
 			__builtin_clz(DA9062AA_LDO1_CONF_MASK) - 1),
+		.vsel_gpi = REG_FIELD(DA9062AA_LDO1_CONT,
+			__builtin_ffs((int)DA9062AA_VLDO1_GPI_MASK) - 1,
+			sizeof(unsigned int) * 8 -
+			__builtin_clz(DA9062AA_VLDO1_GPI_MASK) - 1),
 		.oc_event = REG_FIELD(DA9062AA_STATUS_D,
 			__builtin_ffs((int)DA9062AA_LDO1_ILIM_MASK) - 1,
 			sizeof(unsigned int) * 8 -
@@ -499,6 +607,7 @@ static const struct da9062_regulator_info local_da9061_regulator_info[] = {
 		.desc.name = "DA9061 LDO2",
 		.desc.of_match = of_match_ptr("ldo2"),
 		.desc.regulators_node = of_match_ptr("regulators"),
+		.desc.of_parse_cb = da9062_parse_dt,
 		.desc.ops = &da9062_ldo_ops,
 		.desc.min_uV = (900) * 1000,
 		.desc.uV_step = (50) * 1000,
@@ -522,6 +631,10 @@ static const struct da9062_regulator_info local_da9061_regulator_info[] = {
 			__builtin_ffs((int)DA9062AA_LDO2_CONF_MASK) - 1,
 			sizeof(unsigned int) * 8 -
 			__builtin_clz(DA9062AA_LDO2_CONF_MASK) - 1),
+		.vsel_gpi = REG_FIELD(DA9062AA_LDO2_CONT,
+			__builtin_ffs((int)DA9062AA_VLDO2_GPI_MASK) - 1,
+			sizeof(unsigned int) * 8 -
+			__builtin_clz(DA9062AA_VLDO2_GPI_MASK) - 1),
 		.oc_event = REG_FIELD(DA9062AA_STATUS_D,
 			__builtin_ffs((int)DA9062AA_LDO2_ILIM_MASK) - 1,
 			sizeof(unsigned int) * 8 -
@@ -532,6 +645,7 @@ static const struct da9062_regulator_info local_da9061_regulator_info[] = {
 		.desc.name = "DA9061 LDO3",
 		.desc.of_match = of_match_ptr("ldo3"),
 		.desc.regulators_node = of_match_ptr("regulators"),
+		.desc.of_parse_cb = da9062_parse_dt,
 		.desc.ops = &da9062_ldo_ops,
 		.desc.min_uV = (900) * 1000,
 		.desc.uV_step = (50) * 1000,
@@ -555,6 +669,10 @@ static const struct da9062_regulator_info local_da9061_regulator_info[] = {
 			__builtin_ffs((int)DA9062AA_LDO3_CONF_MASK) - 1,
 			sizeof(unsigned int) * 8 -
 			__builtin_clz(DA9062AA_LDO3_CONF_MASK) - 1),
+		.vsel_gpi = REG_FIELD(DA9062AA_LDO3_CONT,
+			__builtin_ffs((int)DA9062AA_VLDO3_GPI_MASK) - 1,
+			sizeof(unsigned int) * 8 -
+			__builtin_clz(DA9062AA_VLDO3_GPI_MASK) - 1),
 		.oc_event = REG_FIELD(DA9062AA_STATUS_D,
 			__builtin_ffs((int)DA9062AA_LDO3_ILIM_MASK) - 1,
 			sizeof(unsigned int) * 8 -
@@ -565,6 +683,7 @@ static const struct da9062_regulator_info local_da9061_regulator_info[] = {
 		.desc.name = "DA9061 LDO4",
 		.desc.of_match = of_match_ptr("ldo4"),
 		.desc.regulators_node = of_match_ptr("regulators"),
+		.desc.of_parse_cb = da9062_parse_dt,
 		.desc.ops = &da9062_ldo_ops,
 		.desc.min_uV = (900) * 1000,
 		.desc.uV_step = (50) * 1000,
@@ -588,6 +707,10 @@ static const struct da9062_regulator_info local_da9061_regulator_info[] = {
 			__builtin_ffs((int)DA9062AA_LDO4_CONF_MASK) - 1,
 			sizeof(unsigned int) * 8 -
 			__builtin_clz(DA9062AA_LDO4_CONF_MASK) - 1),
+		.vsel_gpi = REG_FIELD(DA9062AA_LDO4_CONT,
+			__builtin_ffs((int)DA9062AA_VLDO4_GPI_MASK) - 1,
+			sizeof(unsigned int) * 8 -
+			__builtin_clz(DA9062AA_VLDO4_GPI_MASK) - 1),
 		.oc_event = REG_FIELD(DA9062AA_STATUS_D,
 			__builtin_ffs((int)DA9062AA_LDO4_ILIM_MASK) - 1,
 			sizeof(unsigned int) * 8 -
@@ -602,6 +725,7 @@ static const struct da9062_regulator_info local_da9062_regulator_info[] = {
 		.desc.name = "DA9062 BUCK1",
 		.desc.of_match = of_match_ptr("buck1"),
 		.desc.regulators_node = of_match_ptr("regulators"),
+		.desc.of_parse_cb = da9062_parse_dt,
 		.desc.ops = &da9062_buck_ops,
 		.desc.min_uV = (300) * 1000,
 		.desc.uV_step = (10) * 1000,
@@ -632,12 +756,17 @@ static const struct da9062_regulator_info local_da9062_regulator_info[] = {
 			__builtin_ffs((int)DA9062AA_BUCK1_CONF_MASK) - 1,
 			sizeof(unsigned int) * 8 -
 			__builtin_clz(DA9062AA_BUCK1_CONF_MASK) - 1),
+		.vsel_gpi = REG_FIELD(DA9062AA_BUCK1_CONT,
+			__builtin_ffs((int)DA9062AA_VBUCK1_GPI_MASK) - 1,
+			sizeof(unsigned int) * 8 -
+			__builtin_clz(DA9062AA_VBUCK1_GPI_MASK) - 1),
 	},
 	{
 		.desc.id = DA9062_ID_BUCK2,
 		.desc.name = "DA9062 BUCK2",
 		.desc.of_match = of_match_ptr("buck2"),
 		.desc.regulators_node = of_match_ptr("regulators"),
+		.desc.of_parse_cb = da9062_parse_dt,
 		.desc.ops = &da9062_buck_ops,
 		.desc.min_uV = (300) * 1000,
 		.desc.uV_step = (10) * 1000,
@@ -668,12 +797,17 @@ static const struct da9062_regulator_info local_da9062_regulator_info[] = {
 			__builtin_ffs((int)DA9062AA_BUCK2_CONF_MASK) - 1,
 			sizeof(unsigned int) * 8 -
 			__builtin_clz(DA9062AA_BUCK2_CONF_MASK) - 1),
+		.vsel_gpi = REG_FIELD(DA9062AA_BUCK2_CONT,
+			__builtin_ffs((int)DA9062AA_VBUCK2_GPI_MASK) - 1,
+			sizeof(unsigned int) * 8 -
+			__builtin_clz(DA9062AA_VBUCK2_GPI_MASK) - 1),
 	},
 	{
 		.desc.id = DA9062_ID_BUCK3,
 		.desc.name = "DA9062 BUCK3",
 		.desc.of_match = of_match_ptr("buck3"),
 		.desc.regulators_node = of_match_ptr("regulators"),
+		.desc.of_parse_cb = da9062_parse_dt,
 		.desc.ops = &da9062_buck_ops,
 		.desc.min_uV = (800) * 1000,
 		.desc.uV_step = (20) * 1000,
@@ -704,12 +838,17 @@ static const struct da9062_regulator_info local_da9062_regulator_info[] = {
 			__builtin_ffs((int)DA9062AA_BUCK3_CONF_MASK) - 1,
 			sizeof(unsigned int) * 8 -
 			__builtin_clz(DA9062AA_BUCK3_CONF_MASK) - 1),
+		.vsel_gpi = REG_FIELD(DA9062AA_BUCK3_CONT,
+			__builtin_ffs((int)DA9062AA_VBUCK3_GPI_MASK) - 1,
+			sizeof(unsigned int) * 8 -
+			__builtin_clz(DA9062AA_VBUCK3_GPI_MASK) - 1),
 	},
 	{
 		.desc.id = DA9062_ID_BUCK4,
 		.desc.name = "DA9062 BUCK4",
 		.desc.of_match = of_match_ptr("buck4"),
 		.desc.regulators_node = of_match_ptr("regulators"),
+		.desc.of_parse_cb = da9062_parse_dt,
 		.desc.ops = &da9062_buck_ops,
 		.desc.min_uV = (530) * 1000,
 		.desc.uV_step = (10) * 1000,
@@ -740,12 +879,17 @@ static const struct da9062_regulator_info local_da9062_regulator_info[] = {
 			__builtin_ffs((int)DA9062AA_BUCK4_CONF_MASK) - 1,
 			sizeof(unsigned int) * 8 -
 			__builtin_clz(DA9062AA_BUCK4_CONF_MASK) - 1),
+		.vsel_gpi = REG_FIELD(DA9062AA_BUCK4_CONT,
+			__builtin_ffs((int)DA9062AA_VBUCK4_GPI_MASK) - 1,
+			sizeof(unsigned int) * 8 -
+			__builtin_clz(DA9062AA_VBUCK4_GPI_MASK) - 1),
 	},
 	{
 		.desc.id = DA9062_ID_LDO1,
 		.desc.name = "DA9062 LDO1",
 		.desc.of_match = of_match_ptr("ldo1"),
 		.desc.regulators_node = of_match_ptr("regulators"),
+		.desc.of_parse_cb = da9062_parse_dt,
 		.desc.ops = &da9062_ldo_ops,
 		.desc.min_uV = (900) * 1000,
 		.desc.uV_step = (50) * 1000,
@@ -769,6 +913,10 @@ static const struct da9062_regulator_info local_da9062_regulator_info[] = {
 			__builtin_ffs((int)DA9062AA_LDO1_CONF_MASK) - 1,
 			sizeof(unsigned int) * 8 -
 			__builtin_clz(DA9062AA_LDO1_CONF_MASK) - 1),
+		.vsel_gpi = REG_FIELD(DA9062AA_LDO1_CONT,
+			__builtin_ffs((int)DA9062AA_VLDO1_GPI_MASK) - 1,
+			sizeof(unsigned int) * 8 -
+			__builtin_clz(DA9062AA_VLDO1_GPI_MASK) - 1),
 		.oc_event = REG_FIELD(DA9062AA_STATUS_D,
 			__builtin_ffs((int)DA9062AA_LDO1_ILIM_MASK) - 1,
 			sizeof(unsigned int) * 8 -
@@ -779,6 +927,7 @@ static const struct da9062_regulator_info local_da9062_regulator_info[] = {
 		.desc.name = "DA9062 LDO2",
 		.desc.of_match = of_match_ptr("ldo2"),
 		.desc.regulators_node = of_match_ptr("regulators"),
+		.desc.of_parse_cb = da9062_parse_dt,
 		.desc.ops = &da9062_ldo_ops,
 		.desc.min_uV = (900) * 1000,
 		.desc.uV_step = (50) * 1000,
@@ -802,6 +951,10 @@ static const struct da9062_regulator_info local_da9062_regulator_info[] = {
 			__builtin_ffs((int)DA9062AA_LDO2_CONF_MASK) - 1,
 			sizeof(unsigned int) * 8 -
 			__builtin_clz(DA9062AA_LDO2_CONF_MASK) - 1),
+		.vsel_gpi = REG_FIELD(DA9062AA_LDO2_CONT,
+			__builtin_ffs((int)DA9062AA_VLDO2_GPI_MASK) - 1,
+			sizeof(unsigned int) * 8 -
+			__builtin_clz(DA9062AA_VLDO2_GPI_MASK) - 1),
 		.oc_event = REG_FIELD(DA9062AA_STATUS_D,
 			__builtin_ffs((int)DA9062AA_LDO2_ILIM_MASK) - 1,
 			sizeof(unsigned int) * 8 -
@@ -812,6 +965,7 @@ static const struct da9062_regulator_info local_da9062_regulator_info[] = {
 		.desc.name = "DA9062 LDO3",
 		.desc.of_match = of_match_ptr("ldo3"),
 		.desc.regulators_node = of_match_ptr("regulators"),
+		.desc.of_parse_cb = da9062_parse_dt,
 		.desc.ops = &da9062_ldo_ops,
 		.desc.min_uV = (900) * 1000,
 		.desc.uV_step = (50) * 1000,
@@ -835,6 +989,10 @@ static const struct da9062_regulator_info local_da9062_regulator_info[] = {
 			__builtin_ffs((int)DA9062AA_LDO3_CONF_MASK) - 1,
 			sizeof(unsigned int) * 8 -
 			__builtin_clz(DA9062AA_LDO3_CONF_MASK) - 1),
+		.vsel_gpi = REG_FIELD(DA9062AA_LDO3_CONT,
+			__builtin_ffs((int)DA9062AA_VLDO3_GPI_MASK) - 1,
+			sizeof(unsigned int) * 8 -
+			__builtin_clz(DA9062AA_VLDO3_GPI_MASK) - 1),
 		.oc_event = REG_FIELD(DA9062AA_STATUS_D,
 			__builtin_ffs((int)DA9062AA_LDO3_ILIM_MASK) - 1,
 			sizeof(unsigned int) * 8 -
@@ -845,6 +1003,7 @@ static const struct da9062_regulator_info local_da9062_regulator_info[] = {
 		.desc.name = "DA9062 LDO4",
 		.desc.of_match = of_match_ptr("ldo4"),
 		.desc.regulators_node = of_match_ptr("regulators"),
+		.desc.of_parse_cb = da9062_parse_dt,
 		.desc.ops = &da9062_ldo_ops,
 		.desc.min_uV = (900) * 1000,
 		.desc.uV_step = (50) * 1000,
@@ -868,6 +1027,10 @@ static const struct da9062_regulator_info local_da9062_regulator_info[] = {
 			__builtin_ffs((int)DA9062AA_LDO4_CONF_MASK) - 1,
 			sizeof(unsigned int) * 8 -
 			__builtin_clz(DA9062AA_LDO4_CONF_MASK) - 1),
+		.vsel_gpi = REG_FIELD(DA9062AA_LDO4_CONT,
+			__builtin_ffs((int)DA9062AA_VLDO4_GPI_MASK) - 1,
+			sizeof(unsigned int) * 8 -
+			__builtin_clz(DA9062AA_VLDO4_GPI_MASK) - 1),
 		.oc_event = REG_FIELD(DA9062AA_STATUS_D,
 			__builtin_ffs((int)DA9062AA_LDO4_ILIM_MASK) - 1,
 			sizeof(unsigned int) * 8 -
@@ -988,6 +1151,15 @@ static int da9062_regulator_probe(struct platform_device *pdev)
 				return PTR_ERR(regl->suspend_sleep);
 		}
 
+		if (regl->info->vsel_gpi.reg) {
+			regl->vsel_gpi = devm_regmap_field_alloc(
+					&pdev->dev,
+					chip->regmap,
+					regl->info->vsel_gpi);
+			if (IS_ERR(regl->vsel_gpi))
+				return PTR_ERR(regl->vsel_gpi);
+		}
+
 		/* Register regulator */
 		memset(&config, 0, sizeof(config));
 		config.dev = chip->dev;
@@ -997,6 +1169,8 @@ static int da9062_regulator_probe(struct platform_device *pdev)
 		regl->rdev = devm_regulator_register(&pdev->dev, &regl->desc,
 						     &config);
 		if (IS_ERR(regl->rdev)) {
+			if (PTR_ERR(regl->rdev) == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
 			dev_err(&pdev->dev,
 				"Failed to register %s regulator\n",
 				regl->desc.name);
-- 
2.20.1

