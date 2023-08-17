Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A6877FF0D
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Aug 2023 22:30:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WiakFm7l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRc8J10yPz3cKK
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Aug 2023 06:30:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WiakFm7l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRc855MNDz3bVf
	for <linux-aspeed@lists.ozlabs.org>; Fri, 18 Aug 2023 06:30:27 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1bee82fad0fso1715665ad.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Aug 2023 13:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692304224; x=1692909024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ePLHPBs2lEPLiyOyP2Z9O6mDkyFMIeuRe9yuhA2Bzms=;
        b=WiakFm7lv/iBJ0k2jjoGfNVzfEcmVwelvqtpsJmVNOOwUPj6YvJxJyatustjy8W1W4
         nM5X2DEQ/A7UdvLN0DtseUcjeCvy7/W36yL2/9hmC94vn/2gDhYQkc8us3Uq0Ox9s0wa
         ryUbd7OJJBvNkVKUPjkmhYz4O0WHiGY6G2KSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692304224; x=1692909024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePLHPBs2lEPLiyOyP2Z9O6mDkyFMIeuRe9yuhA2Bzms=;
        b=Z8F4rGMBXC0zKj+n86Ylw5CPICU4vkGCUJuxQpCDnCxV1G4WEjgStK0m4nogjLhlw2
         9vb8PTjE89jVdh4bvBHHB12m1KzulcjYKO00/KnqS8IOJQwzFn7FrwLocjilm7rcTsPC
         Bs/WxHHtHy0SzQRi6kEF+Fgt5+/Lgd6KLI7h8Nb/1Mgby645pHLEuC0zk2byqOrlCDU5
         kL4ePavlEgyxRUpMD9WsFNye+u/15QrQBoFLaEZVln9hN+FQh8jJqPGdYcApuiSRZWLR
         ZuSTymCSu+q2rkYxO1mPaQYTnooxNEX2RwpogC6SkFrNH+PnBXpdbnNr2xKi/kfSTNn9
         uD+A==
X-Gm-Message-State: AOJu0Yy2Bf5c+6SiTBnBCqC4lO1VZJeJhHkkD5+QNDnlO2nf3yWOnnoN
	4Wxau2oAAufvpqePRlRPK/5l+g==
X-Google-Smtp-Source: AGHT+IG/++lebuPXOTGcWVkGR0Azo7GoArTEfqeEPnjd7zxuUflMdqVFSy0P4ogm05eSsJZ7pUaJ1g==
X-Received: by 2002:a17:902:f690:b0:1bd:ea88:7b93 with SMTP id l16-20020a170902f69000b001bdea887b93mr494923plg.54.1692304224308;
        Thu, 17 Aug 2023 13:30:24 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a16-20020a170902b59000b001bba3650448sm171152pls.258.2023.08.17.13.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 13:30:23 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH] clk: Annotate struct clk_hw_onecell_data with __counted_by
Date: Thu, 17 Aug 2023 13:30:22 -0700
Message-Id: <20230817203019.never.795-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10606; i=keescook@chromium.org;
 h=from:subject:message-id; bh=XUDNIGZF7Cd68CTXufwLImFXIviJ7LfwFBJnpkVIkok=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3oNejG7VEW35Oqe+PrP8iCTNz+BEJ+r64JJBG
 RsN4/THccSJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN6DXgAKCRCJcvTf3G3A
 JrEMD/wPRcgmMjNftw5pFqX1WtITK2MAuEViYU/iF0Fz0vJi3Z80H2azQxbicH8pYfj0Qv7KuNn
 rRz4ulbGlAtkKsQjYNKOWUMJyOPZmnyH8Q+8xsNfW7q/MtnrXk9MQMnE+VCJL91OqH8Ghg3zXqw
 2w+SotPIguqWZmywVOxJ+rz/8eBf012S2qRY7LxKxw5y43BXAdVRceODtMkDqAIqB/ntxxO50vi
 PcQnm5RbALCVpuzwECUu7SRdZkBhhFs0FOzlC1B4abLQEqvvJwpwkEcgk1YegYjaHyW6FpEJbIb
 4yfQN7GC6B5GWhxC0raUN1jsaOGNbFKE8UxTAaM1g1VbhxQCrSIzlI/CYnhaND4Ex7gt5acCI4u
 not7RfxJ4ONgGz0Z7FFAEv44JFXoYNGw5fHcPlYLrfA4ksmx3W3D23C+h7UDGzIBZN5c4KMJVqx
 aYcPJwEG1bexh0FJkZNEWDmayP73tyVuDU9SSXjCx9K14nlfR5M1ppLy6wWIKAAI50lc9xA8kAb
 cGOpHFnIViAhVU6lKiX7zVzQFNY7GM+Xem0jYIC659r6rKlagRfwOFwNkhGbXvE59UaROAtCy33
 ioDMK0F0OpKpqrd0yL06uYQkHzh9JhxRZh9KrYHhfIRpxerV3ZSmV9uIGaoi2qTSQyPS5a4rQ8D
 h+iSVr MCum3DnJA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org, llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org, linux-phy@lists.infradead.org, David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>, Samuel Holland <samuel@sholland.org>, Gregory Clement <gregory.clement@bootlin.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Tom Rix <trix@redhat.com>, linux-sunxi@lists.linux.dev, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kees Cook <keescook@chromium.org>, linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Nathan Chancellor <nathan@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Qin Jian <qinjian@cqplus1.c
 om>, Taichi Sugaya <sugaya.taichi@socionext.com>, Bjorn Andersson <andersson@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, Takao Orito <orito.takao@socionext.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct clk_hw_onecell_data.
Additionally, since the element count member must be set before accessing
the annotated flexible array member, move its initialization earlier.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Taichi Sugaya <sugaya.taichi@socionext.com>
Cc: Takao Orito <orito.takao@socionext.com>
Cc: Qin Jian <qinjian@cqplus1.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory Clement <gregory.clement@bootlin.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-phy@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/clk/clk-aspeed.c                    | 3 +--
 drivers/clk/clk-ast2600.c                   | 2 +-
 drivers/clk/clk-gemini.c                    | 2 +-
 drivers/clk/clk-milbeaut.c                  | 3 +--
 drivers/clk/clk-sp7021.c                    | 3 +--
 drivers/clk/mvebu/cp110-system-controller.c | 2 +-
 drivers/clk/qcom/clk-cpu-8996.c             | 2 +-
 drivers/clk/ralink/clk-mt7621.c             | 3 +--
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c      | 3 +--
 drivers/phy/qualcomm/phy-qcom-edp.c         | 2 +-
 include/linux/clk-provider.h                | 2 +-
 11 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index 284710adaef5..ff84191d0fe8 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -701,6 +701,7 @@ static void __init aspeed_cc_init(struct device_node *np)
 				  GFP_KERNEL);
 	if (!aspeed_clk_data)
 		return;
+	aspeed_clk_data->num = ASPEED_NUM_CLKS;
 
 	/*
 	 * This way all clocks fetched before the platform device probes,
@@ -732,8 +733,6 @@ static void __init aspeed_cc_init(struct device_node *np)
 		aspeed_ast2500_cc(map);
 	else
 		pr_err("unknown platform, failed to add clocks\n");
-
-	aspeed_clk_data->num = ASPEED_NUM_CLKS;
 	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, aspeed_clk_data);
 	if (ret)
 		pr_err("failed to add DT provider: %d\n", ret);
diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index f9e27f95a967..909c3137c428 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -839,6 +839,7 @@ static void __init aspeed_g6_cc_init(struct device_node *np)
 				      ASPEED_G6_NUM_CLKS), GFP_KERNEL);
 	if (!aspeed_g6_clk_data)
 		return;
+	aspeed_g6_clk_data->num = ASPEED_G6_NUM_CLKS;
 
 	/*
 	 * This way all clocks fetched before the platform device probes,
@@ -860,7 +861,6 @@ static void __init aspeed_g6_cc_init(struct device_node *np)
 	}
 
 	aspeed_g6_cc(map);
-	aspeed_g6_clk_data->num = ASPEED_G6_NUM_CLKS;
 	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, aspeed_g6_clk_data);
 	if (ret)
 		pr_err("failed to add DT provider: %d\n", ret);
diff --git a/drivers/clk/clk-gemini.c b/drivers/clk/clk-gemini.c
index a23fa6d47ef1..2572d15aadd0 100644
--- a/drivers/clk/clk-gemini.c
+++ b/drivers/clk/clk-gemini.c
@@ -404,6 +404,7 @@ static void __init gemini_cc_init(struct device_node *np)
 				  GFP_KERNEL);
 	if (!gemini_clk_data)
 		return;
+	gemini_clk_data->num = GEMINI_NUM_CLKS;
 
 	/*
 	 * This way all clock fetched before the platform device probes,
@@ -457,7 +458,6 @@ static void __init gemini_cc_init(struct device_node *np)
 	gemini_clk_data->hws[GEMINI_CLK_APB] = hw;
 
 	/* Register the clocks to be accessed by the device tree */
-	gemini_clk_data->num = GEMINI_NUM_CLKS;
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, gemini_clk_data);
 }
 CLK_OF_DECLARE_DRIVER(gemini_cc, "cortina,gemini-syscon", gemini_cc_init);
diff --git a/drivers/clk/clk-milbeaut.c b/drivers/clk/clk-milbeaut.c
index 050fd4fb588f..18c20aff45f7 100644
--- a/drivers/clk/clk-milbeaut.c
+++ b/drivers/clk/clk-milbeaut.c
@@ -618,6 +618,7 @@ static void __init m10v_cc_init(struct device_node *np)
 
 	if (!m10v_clk_data)
 		return;
+	m10v_clk_data->num = M10V_NUM_CLKS;
 
 	base = of_iomap(np, 0);
 	if (!base) {
@@ -654,8 +655,6 @@ static void __init m10v_cc_init(struct device_node *np)
 					base + CLKSEL(1), 0, 3, 0, rclk_table,
 					&m10v_crglock, NULL);
 	m10v_clk_data->hws[M10V_RCLK_ID] = hw;
-
-	m10v_clk_data->num = M10V_NUM_CLKS;
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, m10v_clk_data);
 }
 CLK_OF_DECLARE_DRIVER(m10v_cc, "socionext,milbeaut-m10v-ccu", m10v_cc_init);
diff --git a/drivers/clk/clk-sp7021.c b/drivers/clk/clk-sp7021.c
index 11d22043ddd7..01d3c4c7b0b2 100644
--- a/drivers/clk/clk-sp7021.c
+++ b/drivers/clk/clk-sp7021.c
@@ -621,6 +621,7 @@ static int sp7021_clk_probe(struct platform_device *pdev)
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
+	clk_data->num = CLK_MAX;
 
 	hws = clk_data->hws;
 	pd_ext.index = 0;
@@ -688,8 +689,6 @@ static int sp7021_clk_probe(struct platform_device *pdev)
 			return PTR_ERR(hws[i]);
 	}
 
-	clk_data->num = CLK_MAX;
-
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
 }
 
diff --git a/drivers/clk/mvebu/cp110-system-controller.c b/drivers/clk/mvebu/cp110-system-controller.c
index 84c8900542e4..03c59bf22106 100644
--- a/drivers/clk/mvebu/cp110-system-controller.c
+++ b/drivers/clk/mvebu/cp110-system-controller.c
@@ -240,9 +240,9 @@ static int cp110_syscon_common_probe(struct platform_device *pdev,
 				      GFP_KERNEL);
 	if (!cp110_clk_data)
 		return -ENOMEM;
+	cp110_clk_data->num = CP110_CLK_NUM;
 
 	cp110_clks = cp110_clk_data->hws;
-	cp110_clk_data->num = CP110_CLK_NUM;
 
 	/* Register the PLL0 which is the root of the hw tree */
 	pll0_name = ap_cp_unique_name(dev, syscon_node, "pll0");
diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 592c7c3cdeb7..72689448a653 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -590,6 +590,7 @@ static int qcom_cpu_clk_msm8996_driver_probe(struct platform_device *pdev)
 	data = devm_kzalloc(dev, struct_size(data, hws, 2), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
+	data->num = 2;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -605,7 +606,6 @@ static int qcom_cpu_clk_msm8996_driver_probe(struct platform_device *pdev)
 
 	data->hws[0] = &pwrcl_pmux.clkr.hw;
 	data->hws[1] = &perfcl_pmux.clkr.hw;
-	data->num = 2;
 
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, data);
 }
diff --git a/drivers/clk/ralink/clk-mt7621.c b/drivers/clk/ralink/clk-mt7621.c
index d95a33293b0a..92d14350c4b3 100644
--- a/drivers/clk/ralink/clk-mt7621.c
+++ b/drivers/clk/ralink/clk-mt7621.c
@@ -521,6 +521,7 @@ static int mt7621_clk_probe(struct platform_device *pdev)
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
+	clk_data->num = count;
 
 	for (i = 0; i < ARRAY_SIZE(mt7621_clks_base); i++)
 		clk_data->hws[i] = mt7621_clk_early[i];
@@ -537,8 +538,6 @@ static int mt7621_clk_probe(struct platform_device *pdev)
 		goto unreg_clk_fixed;
 	}
 
-	clk_data->num = count;
-
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
 	if (ret) {
 		dev_err(dev, "Couldn't add clk hw provider\n");
diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index 6f076cf4b403..a1ca3916f42b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -141,6 +141,7 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
+	clk_data->num = CLK_NUM;
 	tcon_top->clk_data = clk_data;
 
 	spin_lock_init(&tcon_top->reg_lock);
@@ -213,8 +214,6 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 			goto err_unregister_gates;
 		}
 
-	clk_data->num = CLK_NUM;
-
 	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
 				     clk_data);
 	if (ret)
diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index e0e722b9be31..8e5078304646 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -744,6 +744,7 @@ static int qcom_edp_clks_register(struct qcom_edp *edp, struct device_node *np)
 	data = devm_kzalloc(edp->dev, struct_size(data, hws, 2), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
+	data->num = 2;
 
 	snprintf(name, sizeof(name), "%s::link_clk", dev_name(edp->dev));
 	init.ops = &qcom_edp_dp_link_clk_ops;
@@ -763,7 +764,6 @@ static int qcom_edp_clks_register(struct qcom_edp *edp, struct device_node *np)
 
 	data->hws[0] = &edp->dp_link_hw;
 	data->hws[1] = &edp->dp_pixel_hw;
-	data->num = 2;
 
 	return devm_of_clk_add_hw_provider(edp->dev, of_clk_hw_onecell_get, data);
 }
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 0f0cd01906b4..ec32ec58c59f 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1379,7 +1379,7 @@ struct clk_onecell_data {
 
 struct clk_hw_onecell_data {
 	unsigned int num;
-	struct clk_hw *hws[];
+	struct clk_hw *hws[] __counted_by(num);
 };
 
 #define CLK_OF_DECLARE(name, compat, fn) \
-- 
2.34.1

