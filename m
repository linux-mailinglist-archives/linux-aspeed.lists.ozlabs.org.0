Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7F52CB449
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Dec 2020 06:21:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cm6lF4kpgzDqx2
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Dec 2020 16:21:29 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=wangzhiqiang.bj@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=hrM1U8Vb; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cm6dp1mzQzDqBM
 for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Dec 2020 16:16:45 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id l23so337024pjg.1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 01 Dec 2020 21:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mMf+qfonJLf7vMl0DnttrDvVmDvqtmkJr/AXdH4GU4s=;
 b=hrM1U8VbENPacYn1U4AEgrTpRajM5sT3t43YDQBM/Mhiz3nSNes8G8wM0MLqhGSgiI
 bQgsY/YW273VGAxqtuGompMiSNz8t6rLxXFP6i7L0LljLK9T/rY3hJgncGo/Zx4Q40Na
 OwKm/I1rn6L7NplNlomaG5C13Shg+GMrDrAH95FxeVv57cBjGP/SFp4y0JOrmAfYzYcw
 7VCDemlO7NH6HG6TIeLtqK70mKT7u1N0m5ig+xdvIrpTxG295LrLqnqyJVP4t0aOnXfz
 jpYC80w2pJvJtJhstNbv603DQuYlbnLUj7oPigSIb3arvi0kymjxfBzo1YEJ1tmGyCtN
 7X3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mMf+qfonJLf7vMl0DnttrDvVmDvqtmkJr/AXdH4GU4s=;
 b=tdSpZHmpbvCHQaaWwspu6IdnKpXaVdSeiEaahQYtLoX3s6eR1w0xvj3u1vU9UtvBTM
 goIBk66nzZ521z0FkgO343ST1TA+bgKEdexojRvgFiM8aSycFoErWeaXbrVFIkaCH3r2
 dQMlnJfXVdygKZAL7xfw0kVBh51K70KpLk2x6upJVkdxhQAZ8R1gwtBTCKFHnEMTRRLj
 6Afzr1HuCWVO79J+kjjhNc9FA3Awm8arRvfkqMvGFLMG1SS/3dmP4qCmzBMOfLbFAGZg
 sNqissDlcN8njY06vfOFYHfz2qYy3ZMjBchhqYSqSAx0rExDivhXYZoiMqkdohCZ5dJC
 LX8w==
X-Gm-Message-State: AOAM530igL2rkbcpRSCLULUnKWD0+mo9VAIP2ucA8jCkSZblGu9EbejK
 UqMjpEkLKdUcbljWtv8pol1LGQ==
X-Google-Smtp-Source: ABdhPJxuNTwTCv2D3U6L3rbi3cQrrCSLTTNwlSwTJWS+yvZfGvkhW5AL6ItOg8ULKPp2ctl9IZCOgQ==
X-Received: by 2002:a17:902:469:b029:da:17d0:e755 with SMTP id
 96-20020a1709020469b02900da17d0e755mr1149263ple.53.1606886202007; 
 Tue, 01 Dec 2020 21:16:42 -0800 (PST)
Received: from localhost ([61.120.150.72])
 by smtp.gmail.com with ESMTPSA id c20sm582116pgc.25.2020.12.01.21.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 21:16:41 -0800 (PST)
From: John Wang <wangzhiqiang.bj@bytedance.com>
To: xuxiaohan@bytedance.com,
	yulei.sh@bytedance.com
Subject: [PATCH 2/2] ARM: dts: aspeed: Add LCLK to lpc-snoop
Date: Wed,  2 Dec 2020 13:16:34 +0800
Message-Id: <20201202051634.490-2-wangzhiqiang.bj@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202051634.490-1-wangzhiqiang.bj@bytedance.com>
References: <20201202051634.490-1-wangzhiqiang.bj@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 02 Dec 2020 16:21:21 +1100
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 1 +
 arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
 arch/arm/boot/dts/aspeed-g6.dtsi | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index f606fc01ff13..2364b660f2e4 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -370,6 +370,7 @@ lpc_snoop: lpc-snoop@10 {
 						compatible = "aspeed,ast2400-lpc-snoop";
 						reg = <0x10 0x8>;
 						interrupts = <8>;
+						clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
 						status = "disabled";
 					};
 
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 19288495f41a..30bbf7452b90 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -496,6 +496,7 @@ lpc_snoop: lpc-snoop@10 {
 						compatible = "aspeed,ast2500-lpc-snoop";
 						reg = <0x10 0x8>;
 						interrupts = <8>;
+						clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
 						status = "disabled";
 					};
 
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 97ca743363d7..4b1013870fb1 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -520,6 +520,7 @@ lpc_snoop: lpc-snoop@0 {
 						compatible = "aspeed,ast2600-lpc-snoop";
 						reg = <0x0 0x80>;
 						interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+						clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
 						status = "disabled";
 					};
 
-- 
2.25.1

