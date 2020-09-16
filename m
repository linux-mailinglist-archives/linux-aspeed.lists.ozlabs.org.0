Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D1026BFAB
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 10:47:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Brtyr3jsqzDqVq
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 18:47:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DxbK5+ua; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrtyY0g8jzDqVq
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Sep 2020 18:47:32 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id a9so1227800pjg.1
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Sep 2020 01:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vy0K4CKjEHqDFtZtIdPFxXX5NfElkzKFA4+fEQO16tU=;
 b=DxbK5+uaynfs8d4XT1Qk7zJW6jTe+BsnZiQvqPjaAQErW79sWnABNxIahbXQ5hQJav
 AJYVCRh/rrs1uca9ipaegwtzqF60HzDIn566ssYq/fxL8z0xAm7wKIcfhPV/vf2xJjDm
 HTPS7AxhgPHFw5tHAfon3Zf8UgnaqMZ5JuAS5YtS1OCuRC1WtSc22/FQYZLr55ncK3Sh
 CEqG7fpkq1GgQTIR+vsFOCVgDa01rAeehh83NyaRIlqCj2cYcPr7Yru2lTP3PmvXsJWm
 e7P5nW0iO0+/ZSqRJe9oV/wcKEtGfT7WH1rC7CAhka+oxZZLUqoKEuTvvcxrwGwfI1aK
 pDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Vy0K4CKjEHqDFtZtIdPFxXX5NfElkzKFA4+fEQO16tU=;
 b=kUdutJe+q2nkcYsqpEqunZ5R7opiw+Dd/g+IoTkzbV0Wiq6hhAxg+aw/+urmJ0GP3K
 sN3BmVKEK6aGpWqN8kF5N8+u16UVXGWwLS+/gDfJaOF1uBUt1agfwpKRPrh2df0Dyncp
 r4uAYF2GbGSIvv3r9rcm62o9lm37X4NTIe3xZgoG7cc7EZRFiR8OLUFNGNubdFNNXHUC
 f68QHEOqqql8SOz9NOe/topUpDKdD1wDIzPbsmihcbVVMSQf5vgxBY79OlmYsrgbkUsd
 d0Gh90cOv+UXFsOgvvNweRShmAC4iboh1+1U5aPUqhngNS81wYsmFxRrP9QLDLdvoRUn
 TJVQ==
X-Gm-Message-State: AOAM532HufZpu//uOeYKeILfL9/zht5qXGpMX1AEgGcCeb9E3+cE7Wg3
 cYtE2jaoTBbCYMFwG2vTwj4=
X-Google-Smtp-Source: ABdhPJwOVPWVjdhMyFzZkY9OJsxe50W4guT6j4J8PPmequUKNm78Eztabr5kKHz6mxYW9iSH1ieUpA==
X-Received: by 2002:a17:902:c20a:b029:d1:e598:400d with SMTP id
 10-20020a170902c20ab02900d1e598400dmr5383179pll.71.1600246050211; 
 Wed, 16 Sep 2020 01:47:30 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id kf10sm1925323pjb.2.2020.09.16.01.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 01:47:29 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 3/3] ARM: dts: aspeed: Add silicon id node
Date: Wed, 16 Sep 2020 18:17:03 +0930
Message-Id: <20200916084703.778386-4-joel@jms.id.au>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200916084703.778386-1-joel@jms.id.au>
References: <20200916084703.778386-1-joel@jms.id.au>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This register describes the silicon id and chip unique id. It varies
between CPU revisions, but is always part of the SCU.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 5 +++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 5 +++++
 arch/arm/boot/dts/aspeed-g6.dtsi | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 82f0213e3a3c..bc580b75f801 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -192,6 +192,11 @@ p2a: p2a-control@2c {
 					status = "disabled";
 				};
 
+                                silicon-id@7c {
+                                        compatible = "aspeed,ast2400-silicon-id", "aspeed,silicon-id";
+					reg = <0x7c 0x4>;
+                                };
+
 				pinctrl: pinctrl@80 {
 					reg = <0x80 0x18>, <0xa0 0x10>;
 					compatible = "aspeed,ast2400-pinctrl";
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 9c91afb2b404..c6862182313a 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -239,6 +239,11 @@ p2a: p2a-control@2c {
 					status = "disabled";
 				};
 
+				silicon-id@7c {
+					compatible = "aspeed,ast2500-silicon-id", "aspeed,silicon-id";
+					reg = <0x7c 0x4 0x150 0x8>;
+				};
+
 				pinctrl: pinctrl@80 {
 					compatible = "aspeed,ast2500-pinctrl";
 					reg = <0x80 0x18>, <0xa0 0x10>;
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index b58220a49cbd..1ce3a1f06f7f 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -311,6 +311,11 @@ pinctrl: pinctrl {
 					compatible = "aspeed,ast2600-pinctrl";
 				};
 
+				silicon-id@14 {
+					compatible = "aspeed,ast2600-silicon-id", "aspeed,silicon-id";
+					reg = <0x14 0x4 0x5b0 0x8>;
+				};
+
 				smp-memram@180 {
 					compatible = "aspeed,ast2600-smpmem";
 					reg = <0x180 0x40>;
-- 
2.28.0

