Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 929836F1030
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 Apr 2023 04:06:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q6wvG5s3zz3f5Q
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 Apr 2023 12:06:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fgYmFys1;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=zbigniew.lukwinski@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fgYmFys1;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q6qSB3W0bz2yw0
	for <linux-aspeed@lists.ozlabs.org>; Fri, 28 Apr 2023 08:00:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682632858; x=1714168858;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to;
  bh=gBZFrX+qC/YUaj2/U3RooHcQQLX/3WwhhExNIzdpJok=;
  b=fgYmFys1LPM+HyT7MsanRLzenNYo/3mxFhagAKQ86E4eYz8njUPlhZa1
   8GOBgQ6hjFwppnhlD8jepZa9Cdv8XwM/KllZBFIBniNrvqMwROBNrBTRL
   5TpvDPgqR0nLbC/8fb0fjU5/Ysi+7821fTUzOJU9f5Oe0QmTjCoCyn05X
   OuX5Nz81dVPPeOf//JbF8d6U2YUEXN6E/eZNuFkDZlfqUdZ8Ln7922Adf
   goCi2zM9EtbKRWjwshj6jQoTO04Wyhn/yn9Tlg+vsTxJ1WlNMgsLdn+me
   yiyXoZpHGiVQq60HtGVEXpaVss2lYw1SGvPStv1vLvVgITHapfhIaiBFq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="375565653"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208,217";a="375565653"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 15:00:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="940832669"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208,217";a="940832669"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2023 15:00:42 -0700
Received: from [10.249.146.1] (zlukwins-mobl.ger.corp.intel.com [10.249.146.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id D1022580D2C;
	Thu, 27 Apr 2023 15:00:38 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------04QVkPjVgV1hddUSwY1AAZMt"
Message-ID: <671a4bc0-526e-5224-7cb9-f80ebab2c0ef@linux.intel.com>
Date: Fri, 28 Apr 2023 00:00:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 3/3] i3c: ast2600: Add AST2600 platform-specific driver
To: Jeremy Kerr <jk@codeconstruct.com.au>, linux-i3c@lists.infradead.org
References: <20230331091501.3800299-1-jk@codeconstruct.com.au>
 <20230331091501.3800299-4-jk@codeconstruct.com.au>
Content-Language: en-US
From: "Zbigniew, Lukwinski" <zbigniew.lukwinski@linux.intel.com>
In-Reply-To: <20230331091501.3800299-4-jk@codeconstruct.com.au>
X-Mailman-Approved-At: Fri, 28 Apr 2023 12:06:14 +1000
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
Cc: Vitor Soares <ivitro@gmail.com>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, zbigniew.lukwinski@linux.intel.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matt Johnston <matt@codeconstruct.com.au>, Jack Chen <zenghuchen@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------04QVkPjVgV1hddUSwY1AAZMt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/31/2023 11:15 AM, Jeremy Kerr wrote:
> Now that we have platform-specific infrastructure for the dw i3c driver,
> add platform support for the ASPEED AST2600 SoC.
>
> The AST2600 has a small set of "i3c global" registers, providing
> platform-level i3c configuration outside of the i3c core.
>
> For the ast2600, we need a couple of extra setup operations:
>
>   - on probe: find the i3c global register set and parse the SDA pullup
>     resistor values
>
>   - on init: set the pullups accordingly, and set the i3c instance IDs
>
> Signed-off-by: Jeremy Kerr<jk@codeconstruct.com.au>
>
> ---
> v2:
>   - use new dw platform infrastructure
> v3:
>   - switch to embedded struct for platform data
>   - drop of_match_ptr()
> ---
>   MAINTAINERS                             |   6 +
>   drivers/i3c/master/Kconfig              |  14 ++
>   drivers/i3c/master/Makefile             |   1 +
>   drivers/i3c/master/ast2600-i3c-master.c | 168 ++++++++++++++++++++++++
>   4 files changed, 189 insertions(+)
>   create mode 100644 drivers/i3c/master/ast2600-i3c-master.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bd8ebc25afcf..ecadd5ccf771 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9714,6 +9714,12 @@ S:	Orphan
>   F:	Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
>   F:	drivers/i3c/master/dw*
>   
> +I3C DRIVER FOR ASPEED AST2600
> +M:	Jeremy Kerr<jk@codeconstruct.com.au>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
> +F:	drivers/i3c/master/ast2600-i3c-master.c
> +
>   I3C SUBSYSTEM
>   M:	Alexandre Belloni<alexandre.belloni@bootlin.com>
>   L:	linux-i3c@lists.infradead.org  (moderated for non-subscribers)
> diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
> index 3b8f95916f46..90dee3ec5520 100644
> --- a/drivers/i3c/master/Kconfig
> +++ b/drivers/i3c/master/Kconfig
> @@ -22,6 +22,20 @@ config DW_I3C_MASTER
>   	  This driver can also be built as a module.  If so, the module
>   	  will be called dw-i3c-master.
>   
> +config AST2600_I3C_MASTER
> +	tristate "ASPEED AST2600 I3C master driver"
> +	depends on DW_I3C_MASTER
> +	depends on ARCH_ASPEED || COMPILE_TEST
> +	select MFD_SYSCON
> +	help
> +	  Support for ASPEED AST2600 I3C Controller.
> +
> +	  This hardware is an instance of the DW I3C controller; this
> +	  driver adds platform- specific support for AST2600 hardware.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called ast2600-i3c-master.
> +
>   config SVC_I3C_MASTER
>   	tristate "Silvaco I3C Dual-Role Master driver"
>   	depends on I3C
> diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
> index b3fee0f690b2..3e97960160bc 100644
> --- a/drivers/i3c/master/Makefile
> +++ b/drivers/i3c/master/Makefile
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   obj-$(CONFIG_CDNS_I3C_MASTER)		+= i3c-master-cdns.o
>   obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
> +obj-$(CONFIG_AST2600_I3C_MASTER)	+= ast2600-i3c-master.o
>   obj-$(CONFIG_SVC_I3C_MASTER)		+= svc-i3c-master.o
>   obj-$(CONFIG_MIPI_I3C_HCI)		+= mipi-i3c-hci/
> diff --git a/drivers/i3c/master/ast2600-i3c-master.c b/drivers/i3c/master/ast2600-i3c-master.c
> new file mode 100644
> index 000000000000..d265669c04f1
> --- /dev/null
> +++ b/drivers/i3c/master/ast2600-i3c-master.c
> @@ -0,0 +1,168 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023 Code Construct
> + *
> + * Author: Jeremy Kerr<jk@codeconstruct.com.au>
> + */
> +
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include "dw-i3c-master.h"
> +
> +/* AST2600-specific global register set */
> +#define AST2600_I3CG_REG0(idx)	(((idx) * 4 * 4) + 0x10)
> +#define AST2600_I3CG_REG1(idx)	(((idx) * 4 * 4) + 0x14)
> +
> +#define AST2600_I3CG_REG0_SDA_PULLUP_EN_MASK	GENMASK(29, 28)
> +#define AST2600_I3CG_REG0_SDA_PULLUP_EN_2K	(0x0 << 28)
> +#define AST2600_I3CG_REG0_SDA_PULLUP_EN_750	(0x2 << 28)
> +
> +#define AST2600_I3CG_REG1_I2C_MODE		BIT(0)
> +#define AST2600_I3CG_REG1_TEST_MODE		BIT(1)
> +#define AST2600_I3CG_REG1_ACT_MODE_MASK		GENMASK(3, 2)
> +#define AST2600_I3CG_REG1_ACT_MODE(x)		(((x) << 2) & AST2600_I3CG_REG1_ACT_MODE_MASK)
> +#define AST2600_I3CG_REG1_PENDING_INT_MASK	GENMASK(7, 4)
> +#define AST2600_I3CG_REG1_PENDING_INT(x)	(((x) << 4) & AST2600_I3CG_REG1_PENDING_INT_MASK)
> +#define AST2600_I3CG_REG1_SA_MASK		GENMASK(14, 8)
> +#define AST2600_I3CG_REG1_SA(x)			(((x) << 8) & AST2600_I3CG_REG1_SA_MASK)
> +#define AST2600_I3CG_REG1_SA_EN			BIT(15)
> +#define AST2600_I3CG_REG1_INST_ID_MASK		GENMASK(19, 16)
> +#define AST2600_I3CG_REG1_INST_ID(x)		(((x) << 16) & AST2600_I3CG_REG1_INST_ID_MASK)
> +
> +#define AST2600_DEFAULT_SDA_PULLUP_OHMS		2000
> +
> +struct ast2600_i3c {
> +	struct dw_i3c_master dw;
> +	struct regmap *global_regs;
> +	unsigned int global_idx;
> +	unsigned int sda_pullup;
> +};
> +
> +static struct ast2600_i3c *to_ast2600_i3c(struct dw_i3c_master *dw)
> +{
> +	return container_of(dw, struct ast2600_i3c, dw);
> +}
> +
> +static int ast2600_i3c_pullup_to_reg(unsigned int ohms, u32 *regp)
> +{
> +	u32 reg;
> +
> +	switch (ohms) {
> +	case 2000:
> +		reg = AST2600_I3CG_REG0_SDA_PULLUP_EN_2K;
> +		break;
> +	case 750:
> +		reg = AST2600_I3CG_REG0_SDA_PULLUP_EN_750;
> +		break;
> +	case 545:
> +		reg = AST2600_I3CG_REG0_SDA_PULLUP_EN_2K |
> +			AST2600_I3CG_REG0_SDA_PULLUP_EN_750;

It does not work. To enable PullUp=545R you need to set both 28 and 29 
bit (0x*3*0000000) but '/AST2600_I3CG_REG0_SDA_PULLUP_EN_2K | 
AST2600_I3CG_REG0_SDA_PULLUP_EN_750/' is in fact 0x*2*0000000. Maybe you 
could consider adding extra macro 'AST2600_I3CG_REG0_SDA_PULLUP_EN_545' 
= (0x3 << 28)?


> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (regp)
> +		*regp = reg;
> +
> +	return 0;
> +}
> +
> +static int ast2600_i3c_init(struct dw_i3c_master *dw)
> +{
> +	struct ast2600_i3c *i3c = to_ast2600_i3c(dw);
> +	u32 reg = 0;
> +	int rc;
> +
> +	/* reg0: set SDA pullup values */
> +	rc = ast2600_i3c_pullup_to_reg(i3c->sda_pullup, &reg);
> +	if (rc)
> +		return rc;
> +
> +	rc = regmap_write(i3c->global_regs,
> +			  AST2600_I3CG_REG0(i3c->global_idx), reg);
> +	if (rc)
> +		return rc;
> +
> +	/* reg1: set up the instance id, but leave everything else disabled,
> +	 * as it's all for client mode
> +	 */
> +	reg = AST2600_I3CG_REG1_INST_ID(i3c->global_idx);
> +	rc = regmap_write(i3c->global_regs,
> +			  AST2600_I3CG_REG1(i3c->global_idx), reg);
> +
> +	return rc;
> +}
> +
> +const struct dw_i3c_platform_ops ast2600_i3c_ops = {
> +	.init = ast2600_i3c_init,
> +};
> +
> +static int ast2600_i3c_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct of_phandle_args gspec;
> +	struct ast2600_i3c *i3c;
> +	int rc;
> +
> +	i3c = devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL);
> +	if (!i3c)
> +		return -ENOMEM;
> +
> +	rc = of_parse_phandle_with_fixed_args(np, "aspeed,global-regs", 1, 0,
> +					      &gspec);
> +	if (rc)
> +		return -ENODEV;
> +
> +	i3c->global_regs = syscon_node_to_regmap(gspec.np);
> +	of_node_put(gspec.np);
> +
> +	if (IS_ERR(i3c->global_regs))
> +		return PTR_ERR(i3c->global_regs);
> +
> +	i3c->global_idx = gspec.args[0];
> +
> +	rc = of_property_read_u32(np, "sda-pullup-ohms", &i3c->sda_pullup);
> +	if (rc)
> +		i3c->sda_pullup = AST2600_DEFAULT_SDA_PULLUP_OHMS;
> +
> +	rc = ast2600_i3c_pullup_to_reg(i3c->sda_pullup, NULL);
> +	if (rc)
> +		dev_err(&pdev->dev, "invalid sda-pullup value %d\n",
> +			i3c->sda_pullup);
> +
> +	i3c->dw.platform_ops = &ast2600_i3c_ops;
> +	return dw_i3c_common_probe(&i3c->dw, pdev);
> +}
> +
> +static int ast2600_i3c_remove(struct platform_device *pdev)
> +{
> +	struct dw_i3c_master *dw_i3c = platform_get_drvdata(pdev);
> +
> +	return dw_i3c_common_remove(dw_i3c);
> +}
> +
> +static const struct of_device_id ast2600_i3c_master_of_match[] = {
> +	{ .compatible = "aspeed,ast2600-i3c", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ast2600_i3c_master_of_match);
> +
> +static struct platform_driver ast2600_i3c_driver = {
> +	.probe = ast2600_i3c_probe,
> +	.remove = ast2600_i3c_remove,
> +	.driver = {
> +		.name = "ast2600-i3c-master",
> +		.of_match_table = ast2600_i3c_master_of_match,
> +	},
> +};
> +module_platform_driver(ast2600_i3c_driver);
> +
> +MODULE_AUTHOR("Jeremy Kerr<jk@codeconstruct.com.au>");
> +MODULE_DESCRIPTION("ASPEED AST2600 I3C driver");
> +MODULE_LICENSE("GPL");
--------------04QVkPjVgV1hddUSwY1AAZMt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 3/31/2023 11:15 AM, Jeremy Kerr
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230331091501.3800299-4-jk@codeconstruct.com.au">
      <pre class="moz-quote-pre" wrap="">Now that we have platform-specific infrastructure for the dw i3c driver,
add platform support for the ASPEED AST2600 SoC.

The AST2600 has a small set of "i3c global" registers, providing
platform-level i3c configuration outside of the i3c core.

For the ast2600, we need a couple of extra setup operations:

 - on probe: find the i3c global register set and parse the SDA pullup
   resistor values

 - on init: set the pullups accordingly, and set the i3c instance IDs

Signed-off-by: Jeremy Kerr <a class="moz-txt-link-rfc2396E" href="mailto:jk@codeconstruct.com.au">&lt;jk@codeconstruct.com.au&gt;</a>

---
v2:
 - use new dw platform infrastructure
v3:
 - switch to embedded struct for platform data
 - drop of_match_ptr()
---
 MAINTAINERS                             |   6 +
 drivers/i3c/master/Kconfig              |  14 ++
 drivers/i3c/master/Makefile             |   1 +
 drivers/i3c/master/ast2600-i3c-master.c | 168 ++++++++++++++++++++++++
 4 files changed, 189 insertions(+)
 create mode 100644 drivers/i3c/master/ast2600-i3c-master.c

diff --git a/MAINTAINERS b/MAINTAINERS
index bd8ebc25afcf..ecadd5ccf771 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9714,6 +9714,12 @@ S:	Orphan
 F:	Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
 F:	drivers/i3c/master/dw*
 
+I3C DRIVER FOR ASPEED AST2600
+M:	Jeremy Kerr <a class="moz-txt-link-rfc2396E" href="mailto:jk@codeconstruct.com.au">&lt;jk@codeconstruct.com.au&gt;</a>
+S:	Maintained
+F:	Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
+F:	drivers/i3c/master/ast2600-i3c-master.c
+
 I3C SUBSYSTEM
 M:	Alexandre Belloni <a class="moz-txt-link-rfc2396E" href="mailto:alexandre.belloni@bootlin.com">&lt;alexandre.belloni@bootlin.com&gt;</a>
 L:	<a class="moz-txt-link-abbreviated" href="mailto:linux-i3c@lists.infradead.org">linux-i3c@lists.infradead.org</a> (moderated for non-subscribers)
diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
index 3b8f95916f46..90dee3ec5520 100644
--- a/drivers/i3c/master/Kconfig
+++ b/drivers/i3c/master/Kconfig
@@ -22,6 +22,20 @@ config DW_I3C_MASTER
 	  This driver can also be built as a module.  If so, the module
 	  will be called dw-i3c-master.
 
+config AST2600_I3C_MASTER
+	tristate "ASPEED AST2600 I3C master driver"
+	depends on DW_I3C_MASTER
+	depends on ARCH_ASPEED || COMPILE_TEST
+	select MFD_SYSCON
+	help
+	  Support for ASPEED AST2600 I3C Controller.
+
+	  This hardware is an instance of the DW I3C controller; this
+	  driver adds platform- specific support for AST2600 hardware.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called ast2600-i3c-master.
+
 config SVC_I3C_MASTER
 	tristate "Silvaco I3C Dual-Role Master driver"
 	depends on I3C
diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
index b3fee0f690b2..3e97960160bc 100644
--- a/drivers/i3c/master/Makefile
+++ b/drivers/i3c/master/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_CDNS_I3C_MASTER)		+= i3c-master-cdns.o
 obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
+obj-$(CONFIG_AST2600_I3C_MASTER)	+= ast2600-i3c-master.o
 obj-$(CONFIG_SVC_I3C_MASTER)		+= svc-i3c-master.o
 obj-$(CONFIG_MIPI_I3C_HCI)		+= mipi-i3c-hci/
diff --git a/drivers/i3c/master/ast2600-i3c-master.c b/drivers/i3c/master/ast2600-i3c-master.c
new file mode 100644
index 000000000000..d265669c04f1
--- /dev/null
+++ b/drivers/i3c/master/ast2600-i3c-master.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Code Construct
+ *
+ * Author: Jeremy Kerr <a class="moz-txt-link-rfc2396E" href="mailto:jk@codeconstruct.com.au">&lt;jk@codeconstruct.com.au&gt;</a>
+ */
+
+#include &lt;linux/mfd/syscon.h&gt;
+#include &lt;linux/module.h&gt;
+#include &lt;linux/of.h&gt;
+#include &lt;linux/of_device.h&gt;
+#include &lt;linux/platform_device.h&gt;
+#include &lt;linux/regmap.h&gt;
+
+#include "dw-i3c-master.h"
+
+/* AST2600-specific global register set */
+#define AST2600_I3CG_REG0(idx)	(((idx) * 4 * 4) + 0x10)
+#define AST2600_I3CG_REG1(idx)	(((idx) * 4 * 4) + 0x14)
+
+#define AST2600_I3CG_REG0_SDA_PULLUP_EN_MASK	GENMASK(29, 28)
+#define AST2600_I3CG_REG0_SDA_PULLUP_EN_2K	(0x0 &lt;&lt; 28)
+#define AST2600_I3CG_REG0_SDA_PULLUP_EN_750	(0x2 &lt;&lt; 28)
+
+#define AST2600_I3CG_REG1_I2C_MODE		BIT(0)
+#define AST2600_I3CG_REG1_TEST_MODE		BIT(1)
+#define AST2600_I3CG_REG1_ACT_MODE_MASK		GENMASK(3, 2)
+#define AST2600_I3CG_REG1_ACT_MODE(x)		(((x) &lt;&lt; 2) &amp; AST2600_I3CG_REG1_ACT_MODE_MASK)
+#define AST2600_I3CG_REG1_PENDING_INT_MASK	GENMASK(7, 4)
+#define AST2600_I3CG_REG1_PENDING_INT(x)	(((x) &lt;&lt; 4) &amp; AST2600_I3CG_REG1_PENDING_INT_MASK)
+#define AST2600_I3CG_REG1_SA_MASK		GENMASK(14, 8)
+#define AST2600_I3CG_REG1_SA(x)			(((x) &lt;&lt; 8) &amp; AST2600_I3CG_REG1_SA_MASK)
+#define AST2600_I3CG_REG1_SA_EN			BIT(15)
+#define AST2600_I3CG_REG1_INST_ID_MASK		GENMASK(19, 16)
+#define AST2600_I3CG_REG1_INST_ID(x)		(((x) &lt;&lt; 16) &amp; AST2600_I3CG_REG1_INST_ID_MASK)
+
+#define AST2600_DEFAULT_SDA_PULLUP_OHMS		2000
+
+struct ast2600_i3c {
+	struct dw_i3c_master dw;
+	struct regmap *global_regs;
+	unsigned int global_idx;
+	unsigned int sda_pullup;
+};
+
+static struct ast2600_i3c *to_ast2600_i3c(struct dw_i3c_master *dw)
+{
+	return container_of(dw, struct ast2600_i3c, dw);
+}
+
+static int ast2600_i3c_pullup_to_reg(unsigned int ohms, u32 *regp)
+{
+	u32 reg;
+
+	switch (ohms) {
+	case 2000:
+		reg = AST2600_I3CG_REG0_SDA_PULLUP_EN_2K;
+		break;
+	case 750:
+		reg = AST2600_I3CG_REG0_SDA_PULLUP_EN_750;
+		break;
+	case 545:
+		reg = AST2600_I3CG_REG0_SDA_PULLUP_EN_2K |
+			AST2600_I3CG_REG0_SDA_PULLUP_EN_750;</pre>
    </blockquote>
    <p>It does not work. To enable PullUp=545R you need to set both 28
      and 29 bit (0x<b>3</b>0000000) but '<i>AST2600_I3CG_REG0_SDA_PULLUP_EN_2K
        | AST2600_I3CG_REG0_SDA_PULLUP_EN_750</i>' is in fact 0x<b>2</b>0000000.
      Maybe you could consider adding extra macro
      'AST2600_I3CG_REG0_SDA_PULLUP_EN_545' = (0x3 &lt;&lt; 28)?</p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20230331091501.3800299-4-jk@codeconstruct.com.au">
      <pre class="moz-quote-pre" wrap="">
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (regp)
+		*regp = reg;
+
+	return 0;
+}
+
+static int ast2600_i3c_init(struct dw_i3c_master *dw)
+{
+	struct ast2600_i3c *i3c = to_ast2600_i3c(dw);
+	u32 reg = 0;
+	int rc;
+
+	/* reg0: set SDA pullup values */
+	rc = ast2600_i3c_pullup_to_reg(i3c-&gt;sda_pullup, &amp;reg);
+	if (rc)
+		return rc;
+
+	rc = regmap_write(i3c-&gt;global_regs,
+			  AST2600_I3CG_REG0(i3c-&gt;global_idx), reg);
+	if (rc)
+		return rc;
+
+	/* reg1: set up the instance id, but leave everything else disabled,
+	 * as it's all for client mode
+	 */
+	reg = AST2600_I3CG_REG1_INST_ID(i3c-&gt;global_idx);
+	rc = regmap_write(i3c-&gt;global_regs,
+			  AST2600_I3CG_REG1(i3c-&gt;global_idx), reg);
+
+	return rc;
+}
+
+const struct dw_i3c_platform_ops ast2600_i3c_ops = {
+	.init = ast2600_i3c_init,
+};
+
+static int ast2600_i3c_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev-&gt;dev.of_node;
+	struct of_phandle_args gspec;
+	struct ast2600_i3c *i3c;
+	int rc;
+
+	i3c = devm_kzalloc(&amp;pdev-&gt;dev, sizeof(*i3c), GFP_KERNEL);
+	if (!i3c)
+		return -ENOMEM;
+
+	rc = of_parse_phandle_with_fixed_args(np, "aspeed,global-regs", 1, 0,
+					      &amp;gspec);
+	if (rc)
+		return -ENODEV;
+
+	i3c-&gt;global_regs = syscon_node_to_regmap(gspec.np);
+	of_node_put(gspec.np);
+
+	if (IS_ERR(i3c-&gt;global_regs))
+		return PTR_ERR(i3c-&gt;global_regs);
+
+	i3c-&gt;global_idx = gspec.args[0];
+
+	rc = of_property_read_u32(np, "sda-pullup-ohms", &amp;i3c-&gt;sda_pullup);
+	if (rc)
+		i3c-&gt;sda_pullup = AST2600_DEFAULT_SDA_PULLUP_OHMS;
+
+	rc = ast2600_i3c_pullup_to_reg(i3c-&gt;sda_pullup, NULL);
+	if (rc)
+		dev_err(&amp;pdev-&gt;dev, "invalid sda-pullup value %d\n",
+			i3c-&gt;sda_pullup);
+
+	i3c-&gt;dw.platform_ops = &amp;ast2600_i3c_ops;
+	return dw_i3c_common_probe(&amp;i3c-&gt;dw, pdev);
+}
+
+static int ast2600_i3c_remove(struct platform_device *pdev)
+{
+	struct dw_i3c_master *dw_i3c = platform_get_drvdata(pdev);
+
+	return dw_i3c_common_remove(dw_i3c);
+}
+
+static const struct of_device_id ast2600_i3c_master_of_match[] = {
+	{ .compatible = "aspeed,ast2600-i3c", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ast2600_i3c_master_of_match);
+
+static struct platform_driver ast2600_i3c_driver = {
+	.probe = ast2600_i3c_probe,
+	.remove = ast2600_i3c_remove,
+	.driver = {
+		.name = "ast2600-i3c-master",
+		.of_match_table = ast2600_i3c_master_of_match,
+	},
+};
+module_platform_driver(ast2600_i3c_driver);
+
+MODULE_AUTHOR("Jeremy Kerr <a class="moz-txt-link-rfc2396E" href="mailto:jk@codeconstruct.com.au">&lt;jk@codeconstruct.com.au&gt;</a>");
+MODULE_DESCRIPTION("ASPEED AST2600 I3C driver");
+MODULE_LICENSE("GPL");
</pre>
    </blockquote>
  </body>
</html>

--------------04QVkPjVgV1hddUSwY1AAZMt--
