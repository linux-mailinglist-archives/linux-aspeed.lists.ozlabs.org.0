Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F88977FF46
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Aug 2023 22:49:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.a=rsa-sha256 header.s=default header.b=XOVQVo3B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRcYw3Yjtz3cKc
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Aug 2023 06:49:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.a=rsa-sha256 header.s=default header.b=XOVQVo3B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=embeddedor.com (client-ip=35.89.44.39; helo=omta40.uswest2.a.cloudfilter.net; envelope-from=gustavo@embeddedor.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 339 seconds by postgrey-1.37 at boromir; Fri, 18 Aug 2023 06:49:17 AEST
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRcYn2Nw6z3c2y
	for <linux-aspeed@lists.ozlabs.org>; Fri, 18 Aug 2023 06:49:16 +1000 (AEST)
Received: from eig-obgw-6001a.ext.cloudfilter.net ([10.0.30.140])
	by cmsmtp with ESMTP
	id WQQmqxEANbK1VWjohqcws4; Thu, 17 Aug 2023 20:42:03 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id Wjogq4PJFyB3AWjogqDNLx; Thu, 17 Aug 2023 20:42:02 +0000
X-Authority-Analysis: v=2.4 cv=UZlC9YeN c=1 sm=1 tr=0 ts=64de861b
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=UttIx32zK-AA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=IpJZQVW2AAAA:8 a=VwQbUJbxAAAA:8 a=c-n4J4-pAAAA:8 a=XPfOMz_LAAAA:8
 a=P-IC7800AAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8
 a=zu6OG0ZhAAAA:8 a=FlkJ-zHRAAAA:8 a=JfrnYn6hAAAA:8 a=voM4FWlXAAAA:8
 a=e5mUnYsNAAAA:8 a=cm27Pg_UAAAA:8 a=mYo5tDoLIR1weVEbl60A:9 a=QEXdDO2ut3YA:10
 a=IawgGOuG5U0WyFbmm1f5:22 a=AjGcO6oz07-iQ99wixmX:22 a=L0NDqeB7ZLmQzAogN4cw:22
 a=mTuXyI7nMZpd5pdLa428:22 a=d3PnA9EDa4IxuAV0gXij:22 a=cvBusfyB2V15izCimMoJ:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=pAN39diAhXWuPx0-Vjn3:22 a=rcJ5IfC3ewqtVv14NVGK:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=IC2XNlieTeVoXbcui8wp:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9rxpK7oeGH/u4pk+tUlKyS3S2P3FaP+s+fkAyW7pq9A=; b=XOVQVo3BxnVxjOb5JTZPc40fxM
	kKgmgj9iW/7Y4Slx9vP5PaviKcedkWxT+9RtGsQ4j/GbICmsy+bapQ8DK56v68nIRPMiXKIo1UY8a
	XUUQS4FPcPkXiP6fkZmGdTOXdDPGD2QKagMI8kmxe6RdaUDJ4q3KxaGW6SoqC6e9APUDICSktVMMr
	lK/EQ+ga8+iHTkymF1e7yyo+Ma0Qtrql4wrdztg9JavHJpv9+HpmYSs2MdGg52pcAY18Qf7qHI6wd
	9sN26nXpV8jZCrIT0TNhD3B7B2KpadAofLE1SoMkAiAUZ4U0vigqXuDTyp4BrzNRms7eRvjvdA/Ew
	yIX9zgpw==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:38244 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qWjoa-001B6O-2R;
	Thu, 17 Aug 2023 15:41:57 -0500
Message-ID: <00ce86aa-a5fa-6f89-6e3d-5dd2830d0665@embeddedor.com>
Date: Thu, 17 Aug 2023 14:42:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] clk: Annotate struct clk_hw_onecell_data with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>
References: <20230817203019.never.795-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230817203019.never.795-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qWjoa-001B6O-2R
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:38244
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 12
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHBf0Mx6jscyZRWdhRiuT4XR+FbexPOBbNcyGZKtk/vKwOFOkikTDRZ4v9conjPe2KK8drvaWCDRk6zSr2tU/x1ZZdnoudTsyYfUG/B0zGoR0m7HLOAO
 5rFS8ffYe90YG/zBgoEy15Nb+1g+TF0Quk88z5rvMT1piAIc2RnoLHMOaS5GXhCAhhIOwn73QEeOsYqOU54nalxShvL+iou/jyXf7ZgMm9Le1/Psrb/SOMZ3
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org, llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org, linux-phy@lists.infradead.org, David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>, Samuel Holland <samuel@sholland.org>, Gregory Clement <gregory.clement@bootlin.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Tom Rix <trix@redhat.com>, linux-sunxi@lists.linux.dev, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Nathan Chancellor <nathan@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Qin Jian <qinjian@cqplus1.com>, Taichi Sugaya <sugaya.taichi@s
 ocionext.com>, Bjorn Andersson <andersson@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, Takao Orito <orito.takao@socionext.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On 8/17/23 14:30, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct clk_hw_onecell_data.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Taichi Sugaya <sugaya.taichi@socionext.com>
> Cc: Takao Orito <orito.takao@socionext.com>
> Cc: Qin Jian <qinjian@cqplus1.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Gregory Clement <gregory.clement@bootlin.com>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Kishon Vijay Abraham I <kishon@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-sunxi@lists.linux.dev
> Cc: linux-phy@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>   drivers/clk/clk-aspeed.c                    | 3 +--
>   drivers/clk/clk-ast2600.c                   | 2 +-
>   drivers/clk/clk-gemini.c                    | 2 +-
>   drivers/clk/clk-milbeaut.c                  | 3 +--
>   drivers/clk/clk-sp7021.c                    | 3 +--
>   drivers/clk/mvebu/cp110-system-controller.c | 2 +-
>   drivers/clk/qcom/clk-cpu-8996.c             | 2 +-
>   drivers/clk/ralink/clk-mt7621.c             | 3 +--
>   drivers/gpu/drm/sun4i/sun8i_tcon_top.c      | 3 +--
>   drivers/phy/qualcomm/phy-qcom-edp.c         | 2 +-
>   include/linux/clk-provider.h                | 2 +-
>   11 files changed, 11 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 284710adaef5..ff84191d0fe8 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -701,6 +701,7 @@ static void __init aspeed_cc_init(struct device_node *np)
>   				  GFP_KERNEL);
>   	if (!aspeed_clk_data)
>   		return;
> +	aspeed_clk_data->num = ASPEED_NUM_CLKS;
>   
>   	/*
>   	 * This way all clocks fetched before the platform device probes,
> @@ -732,8 +733,6 @@ static void __init aspeed_cc_init(struct device_node *np)
>   		aspeed_ast2500_cc(map);
>   	else
>   		pr_err("unknown platform, failed to add clocks\n");
> -
> -	aspeed_clk_data->num = ASPEED_NUM_CLKS;
>   	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, aspeed_clk_data);
>   	if (ret)
>   		pr_err("failed to add DT provider: %d\n", ret);
> diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
> index f9e27f95a967..909c3137c428 100644
> --- a/drivers/clk/clk-ast2600.c
> +++ b/drivers/clk/clk-ast2600.c
> @@ -839,6 +839,7 @@ static void __init aspeed_g6_cc_init(struct device_node *np)
>   				      ASPEED_G6_NUM_CLKS), GFP_KERNEL);
>   	if (!aspeed_g6_clk_data)
>   		return;
> +	aspeed_g6_clk_data->num = ASPEED_G6_NUM_CLKS;
>   
>   	/*
>   	 * This way all clocks fetched before the platform device probes,
> @@ -860,7 +861,6 @@ static void __init aspeed_g6_cc_init(struct device_node *np)
>   	}
>   
>   	aspeed_g6_cc(map);
> -	aspeed_g6_clk_data->num = ASPEED_G6_NUM_CLKS;
>   	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, aspeed_g6_clk_data);
>   	if (ret)
>   		pr_err("failed to add DT provider: %d\n", ret);
> diff --git a/drivers/clk/clk-gemini.c b/drivers/clk/clk-gemini.c
> index a23fa6d47ef1..2572d15aadd0 100644
> --- a/drivers/clk/clk-gemini.c
> +++ b/drivers/clk/clk-gemini.c
> @@ -404,6 +404,7 @@ static void __init gemini_cc_init(struct device_node *np)
>   				  GFP_KERNEL);
>   	if (!gemini_clk_data)
>   		return;
> +	gemini_clk_data->num = GEMINI_NUM_CLKS;
>   
>   	/*
>   	 * This way all clock fetched before the platform device probes,
> @@ -457,7 +458,6 @@ static void __init gemini_cc_init(struct device_node *np)
>   	gemini_clk_data->hws[GEMINI_CLK_APB] = hw;
>   
>   	/* Register the clocks to be accessed by the device tree */
> -	gemini_clk_data->num = GEMINI_NUM_CLKS;
>   	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, gemini_clk_data);
>   }
>   CLK_OF_DECLARE_DRIVER(gemini_cc, "cortina,gemini-syscon", gemini_cc_init);
> diff --git a/drivers/clk/clk-milbeaut.c b/drivers/clk/clk-milbeaut.c
> index 050fd4fb588f..18c20aff45f7 100644
> --- a/drivers/clk/clk-milbeaut.c
> +++ b/drivers/clk/clk-milbeaut.c
> @@ -618,6 +618,7 @@ static void __init m10v_cc_init(struct device_node *np)
>   
>   	if (!m10v_clk_data)
>   		return;
> +	m10v_clk_data->num = M10V_NUM_CLKS;
>   
>   	base = of_iomap(np, 0);
>   	if (!base) {
> @@ -654,8 +655,6 @@ static void __init m10v_cc_init(struct device_node *np)
>   					base + CLKSEL(1), 0, 3, 0, rclk_table,
>   					&m10v_crglock, NULL);
>   	m10v_clk_data->hws[M10V_RCLK_ID] = hw;
> -
> -	m10v_clk_data->num = M10V_NUM_CLKS;
>   	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, m10v_clk_data);
>   }
>   CLK_OF_DECLARE_DRIVER(m10v_cc, "socionext,milbeaut-m10v-ccu", m10v_cc_init);
> diff --git a/drivers/clk/clk-sp7021.c b/drivers/clk/clk-sp7021.c
> index 11d22043ddd7..01d3c4c7b0b2 100644
> --- a/drivers/clk/clk-sp7021.c
> +++ b/drivers/clk/clk-sp7021.c
> @@ -621,6 +621,7 @@ static int sp7021_clk_probe(struct platform_device *pdev)
>   				GFP_KERNEL);
>   	if (!clk_data)
>   		return -ENOMEM;
> +	clk_data->num = CLK_MAX;
>   
>   	hws = clk_data->hws;
>   	pd_ext.index = 0;
> @@ -688,8 +689,6 @@ static int sp7021_clk_probe(struct platform_device *pdev)
>   			return PTR_ERR(hws[i]);
>   	}
>   
> -	clk_data->num = CLK_MAX;
> -
>   	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
>   }
>   
> diff --git a/drivers/clk/mvebu/cp110-system-controller.c b/drivers/clk/mvebu/cp110-system-controller.c
> index 84c8900542e4..03c59bf22106 100644
> --- a/drivers/clk/mvebu/cp110-system-controller.c
> +++ b/drivers/clk/mvebu/cp110-system-controller.c
> @@ -240,9 +240,9 @@ static int cp110_syscon_common_probe(struct platform_device *pdev,
>   				      GFP_KERNEL);
>   	if (!cp110_clk_data)
>   		return -ENOMEM;
> +	cp110_clk_data->num = CP110_CLK_NUM;
>   
>   	cp110_clks = cp110_clk_data->hws;
> -	cp110_clk_data->num = CP110_CLK_NUM;
>   
>   	/* Register the PLL0 which is the root of the hw tree */
>   	pll0_name = ap_cp_unique_name(dev, syscon_node, "pll0");
> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
> index 592c7c3cdeb7..72689448a653 100644
> --- a/drivers/clk/qcom/clk-cpu-8996.c
> +++ b/drivers/clk/qcom/clk-cpu-8996.c
> @@ -590,6 +590,7 @@ static int qcom_cpu_clk_msm8996_driver_probe(struct platform_device *pdev)
>   	data = devm_kzalloc(dev, struct_size(data, hws, 2), GFP_KERNEL);
>   	if (!data)
>   		return -ENOMEM;
> +	data->num = 2;
>   
>   	base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(base))
> @@ -605,7 +606,6 @@ static int qcom_cpu_clk_msm8996_driver_probe(struct platform_device *pdev)
>   
>   	data->hws[0] = &pwrcl_pmux.clkr.hw;
>   	data->hws[1] = &perfcl_pmux.clkr.hw;
> -	data->num = 2;
>   
>   	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, data);
>   }
> diff --git a/drivers/clk/ralink/clk-mt7621.c b/drivers/clk/ralink/clk-mt7621.c
> index d95a33293b0a..92d14350c4b3 100644
> --- a/drivers/clk/ralink/clk-mt7621.c
> +++ b/drivers/clk/ralink/clk-mt7621.c
> @@ -521,6 +521,7 @@ static int mt7621_clk_probe(struct platform_device *pdev)
>   				GFP_KERNEL);
>   	if (!clk_data)
>   		return -ENOMEM;
> +	clk_data->num = count;
>   
>   	for (i = 0; i < ARRAY_SIZE(mt7621_clks_base); i++)
>   		clk_data->hws[i] = mt7621_clk_early[i];
> @@ -537,8 +538,6 @@ static int mt7621_clk_probe(struct platform_device *pdev)
>   		goto unreg_clk_fixed;
>   	}
>   
> -	clk_data->num = count;
> -
>   	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
>   	if (ret) {
>   		dev_err(dev, "Couldn't add clk hw provider\n");
> diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> index 6f076cf4b403..a1ca3916f42b 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> @@ -141,6 +141,7 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
>   				GFP_KERNEL);
>   	if (!clk_data)
>   		return -ENOMEM;
> +	clk_data->num = CLK_NUM;
>   	tcon_top->clk_data = clk_data;
>   
>   	spin_lock_init(&tcon_top->reg_lock);
> @@ -213,8 +214,6 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
>   			goto err_unregister_gates;
>   		}
>   
> -	clk_data->num = CLK_NUM;
> -
>   	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
>   				     clk_data);
>   	if (ret)
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index e0e722b9be31..8e5078304646 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -744,6 +744,7 @@ static int qcom_edp_clks_register(struct qcom_edp *edp, struct device_node *np)
>   	data = devm_kzalloc(edp->dev, struct_size(data, hws, 2), GFP_KERNEL);
>   	if (!data)
>   		return -ENOMEM;
> +	data->num = 2;
>   
>   	snprintf(name, sizeof(name), "%s::link_clk", dev_name(edp->dev));
>   	init.ops = &qcom_edp_dp_link_clk_ops;
> @@ -763,7 +764,6 @@ static int qcom_edp_clks_register(struct qcom_edp *edp, struct device_node *np)
>   
>   	data->hws[0] = &edp->dp_link_hw;
>   	data->hws[1] = &edp->dp_pixel_hw;
> -	data->num = 2;
>   
>   	return devm_of_clk_add_hw_provider(edp->dev, of_clk_hw_onecell_get, data);
>   }
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 0f0cd01906b4..ec32ec58c59f 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -1379,7 +1379,7 @@ struct clk_onecell_data {
>   
>   struct clk_hw_onecell_data {
>   	unsigned int num;
> -	struct clk_hw *hws[];
> +	struct clk_hw *hws[] __counted_by(num);
>   };
>   
>   #define CLK_OF_DECLARE(name, compat, fn) \
