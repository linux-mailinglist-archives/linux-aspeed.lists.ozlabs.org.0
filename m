Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 184112D274E
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 10:18:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cqvjh1F17zDqW6
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 20:18:16 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=wangzhiqiang.bj@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=sWF3Oq7Z; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqvjP5MnJzDqVd
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Dec 2020 20:18:01 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id r4so2541858pls.11
 for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Dec 2020 01:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O23hLkgyH0AcKUIRz35EyTfrfmWRh12qepszTmHy6M0=;
 b=sWF3Oq7ZiWpR+RT9ltmHND+8KJzJEXMMUqH1WTlfcLyOxDkrlzOb1p1fMkmDb7kUE6
 Dl3y/wBXggGObriktKRjmBoHtJhR+qTva8p+CdfaLYSeJ5vW2AjcBzJt5yDQtpKxiQNf
 iV2MqEfo8DWmhDqjdOH/1YLo1xfijgQvSI1KmpGws99sPVoXRRXwI2sPgfxiZsSrvH78
 /nL5NywoJoE0+MF1G/yhibtSO7vyP44vi7+pYnnkKNZaZ9fkEbP0QKnORGuHuCC92Kng
 iisHFcHU1IzMmJuuj8BFuEWfV4ghgTeGCQSC83MxE2stQ+3a/5pJW9t2NM1ZHKoa132y
 agzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O23hLkgyH0AcKUIRz35EyTfrfmWRh12qepszTmHy6M0=;
 b=LmXIs6rqHD0KcYPDYcQnwKsIeotEXOSJ42b9swJbOQ9R2eFOtbZjfzZnWXBJITAVO2
 K3+4jkiV6pCmnxQahqoX+vCP0N6/e+UsZaxVep1PaBmY/Ztj5puMTg0ADpEUqshDlZ7+
 S2ddUBOLHevakqcBl07bk8Ge0SYBSgH4ONETbe8/5eOnMBtsDfa7VcesB24CL+/cC5HN
 Y91Yp3pKAPaY5t2yMgPeYp4ImAfe2Sxqhl2FcVvK/5wNVUEX875ZQbNb7a7oHxbR4j5a
 xezb5E6s3cMCYRWQNbHx5VejOPaS7QSeo2Yuf2bUGLe3bcxekwxaJavtMmIvIqp1wDct
 EnFQ==
X-Gm-Message-State: AOAM5304lt2z7bQSqydiRKYclEI+jMVKEyUMo+9IumCpAisDxbjvJDYx
 xQ+zs/lLLYWaw38Wg3ASLsAUrzf3LWi1ugJ0
X-Google-Smtp-Source: ABdhPJzBJwYpLEgguIwpyagLjMIA0KtTmhV5jpPvnwVOSWeNBmEIlXJtUZVeoaxiths8I67hUfaIIw==
X-Received: by 2002:a17:902:6b02:b029:da:c6c0:d650 with SMTP id
 o2-20020a1709026b02b02900dac6c0d650mr20751147plk.74.1607419078949; 
 Tue, 08 Dec 2020 01:17:58 -0800 (PST)
Received: from localhost ([61.120.150.75])
 by smtp.gmail.com with ESMTPSA id z65sm18357294pfz.126.2020.12.08.01.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 01:17:58 -0800 (PST)
From: John Wang <wangzhiqiang.bj@bytedance.com>
To: xuxiaohan@bytedance.com,
	yulei.sh@bytedance.com
Subject: [PATCH v2 2/2] ARM: dts: aspeed: Add LCLK to lpc-snoop
Date: Tue,  8 Dec 2020 17:17:48 +0800
Message-Id: <20201208091748.1920-2-wangzhiqiang.bj@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208091748.1920-1-wangzhiqiang.bj@bytedance.com>
References: <20201208091748.1920-1-wangzhiqiang.bj@bytedance.com>
MIME-Version: 1.0
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Fixes: d558ce0ff0730 (ARM: dts: aspeed: Add LPC Snoop device)
Fixes: 12ce8bd361c72 (ARM: dts: aspeed-g6: Add lpc devices)

Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
---
v2:
  reword: Add fixes lines
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

