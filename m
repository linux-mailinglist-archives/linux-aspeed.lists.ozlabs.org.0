Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D864639D350
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Jun 2021 05:13:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fyz3R2Q21z3026
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Jun 2021 13:13:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oeREX2FL;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oeREX2FL; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyz3K6d2Kz306h
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Jun 2021 13:13:33 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id n12so12704327pgs.13
 for <linux-aspeed@lists.ozlabs.org>; Sun, 06 Jun 2021 20:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rdd1cyo8NhjciIDXNShJmJIc+MDEMKHy4XucTuV1PW0=;
 b=oeREX2FL6Jr5YwFBAZ0rK0YzuywG1R1FseFrk4aDul7Jl5S5TcZW2i3cBTnby+M587
 A3gpEs45HvDoz9KzRscteG/gcScJXWS+TAj2rWaymB1r9uPtbNdMu0dfHOYxlCC4jl6u
 bWNaeF9WxW7NRH0IGts9sYYnq6NmR1Br5MGrjwT4ICvraYiLjcdxwq5ywDzaD773OLuW
 D8IWw6ME/57ft5UjJ9cC1ag40fGJZc4p5Db5LZMWPE+AjL+F+XTPIflGZs8Q1z87n+Q4
 eHwXPpV4jxJ0k/WQqtYLNJFDewE67SSn9EZokwXd6Pb6bpgy3B/eaq1fLxG0xP6QWk5o
 LQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Rdd1cyo8NhjciIDXNShJmJIc+MDEMKHy4XucTuV1PW0=;
 b=D331Se9DUY9ovvCbcSazp3ph6v8bsRz81vWmffpCc6cBodD1OXcjNzJMr6OMVyLP/r
 4EWCU6YFRskYx2QWplQ4wjuGBozMBBL05sDZa4xMgs0yZyKoyRFtthAGWnsyeafjDidH
 Ua3FycC0W5AmZ6h15kNXZwT4Qlw/ni5YtOUSc7ADyXpk7NKoQ5MoyeLu/ALy+0uz+Dkh
 o4Mx3gvDTuozTQDl1SzVnaxydrKbbLf4iCF12hXEskoOGMlHYZj+Bc1lfGYLB7xWffl9
 WaopRywpLp6ue2ZjZVzUImlpq7DjBuE3qeKFENT4UP4yJAxGdfAjgHEd8BiPf2P581vj
 PAHA==
X-Gm-Message-State: AOAM532/W2HaZ5NxUPJEjggJ/0r1+BHYZiF0c7YsNbfiyngJVory7d46
 W+6nTfjQD4T0+rWV8x6Vn3i7Vu7Yvek=
X-Google-Smtp-Source: ABdhPJy5CLAszmZnDH7QVcxxFYC645JtYLY3vQ7R2p5ghWSb/PRxRDr9pvdc909BAiiJzqwml8qmHQ==
X-Received: by 2002:a05:6a00:b83:b029:2ec:7400:ae59 with SMTP id
 g3-20020a056a000b83b02902ec7400ae59mr15364417pfj.11.1623035611618; 
 Sun, 06 Jun 2021 20:13:31 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id x33sm5763751pfh.108.2021.06.06.20.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 20:13:30 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH 3/6] ARM: dts: aspeed: everest: Add pcie slot indicator leds
Date: Mon,  7 Jun 2021 12:42:56 +0930
Message-Id: <20210607031259.475020-4-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210607031259.475020-1-joel@jms.id.au>
References: <20210607031259.475020-1-joel@jms.id.au>
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
Cc: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>

These are pcie slot indicator leds driven by PCA9552.

Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 123 +++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 03c26812c909..aa960186796d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -721,6 +721,129 @@ eeprom@51 {
 			};
 		};
 	};
+
+	pca_pcie_slot: pca9552@65 {
+		compatible = "nxp,pca9552";
+		reg = <0x65>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio@0 {
+			reg = <0>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		led@1 {
+			label = "pcieslot-c01";
+			reg = <1>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@2 {
+			label = "pcieslot-c02";
+			reg = <2>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@3 {
+			label = "pcieslot-c03";
+			reg = <3>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@4 {
+			label = "pcieslot-c04";
+			reg = <4>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@5 {
+			label = "pcieslot-c05";
+			reg = <5>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@6 {
+			label = "pcieslot-c06";
+			reg = <6>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@7 {
+			label = "pcieslot-c07";
+			reg = <7>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@8 {
+			label = "pcieslot-c08";
+			reg = <8>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@9 {
+			label = "pcieslot-c09";
+			reg = <9>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@10 {
+			label = "pcieslot-c10";
+			reg = <10>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@11 {
+			label = "pcieslot-c11";
+			reg = <11>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		gpio@12 {
+			reg = <12>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@13 {
+			reg = <13>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@14 {
+			reg = <14>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@15 {
+			reg = <15>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
 };
 
 &i2c7 {
-- 
2.30.2

