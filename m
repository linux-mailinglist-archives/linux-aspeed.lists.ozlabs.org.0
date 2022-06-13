Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A14D5483C4
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Jun 2022 11:54:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LM6NT1M5lz3c7S
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Jun 2022 19:54:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aZRWYoBc;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aZRWYoBc;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LM6NG6Z8Gz3bkv
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Jun 2022 19:54:06 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id k12-20020a17090a404c00b001eaabc1fe5dso2467543pjg.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Jun 2022 02:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u0NPneZZ9r0x4Kp8TclBRmjdl0tXAndSbSU1SBOWrP4=;
        b=aZRWYoBcDfcD6fB9QGEddxaw1as+HrnOVFyOdoq0/lJ7Xsy3XmVMhiUC3Dck89rqxg
         dQEXNHsXxoZsBMoNRVv/Mk7nL7nRICE9qlEhypAdGv8JP+CiPFz7fsrMRSrmRVzBYhqV
         69k+OEhlN2HJIPP1Ntll+fh/tLs49QUl1L6nLH2l20o8Nkj2Exs1Pz39AN71391pNTeO
         Hh7BqBYYNWMDgd6BQkDsfORl4SaQaI2Nd1QlXAcIlstHkWFbf2sQALiDom25ttP6/EyA
         eo5QbnAOlicF6qcgGrJXJryjxKq85Xfe16a0lq44zoMpuYlj7+9bhRsk34LL0bqjmxAu
         xyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=u0NPneZZ9r0x4Kp8TclBRmjdl0tXAndSbSU1SBOWrP4=;
        b=KmfkFrgoir8mD+0qDalaPJEGBSKyEjFrOcd1zVYijefBwfFTpjH+1kamBqUP0wJMZI
         mFn/30urhV3vC3yTbKBsPcrvr3BtIwJ0M4RTFeoaIIj4X0ruXA9CmapXgx/QAHxQ4x7Y
         hqtbysvcz47qPtbMMw/qLB0nw7F03w8iZeBF3FoaTwHj3kkWYwkSXCQ0bQoHFuZXWRst
         xcJprQu7wdLnt4qemBP38kZITVZN4aIpga602f7YKuoDcFwngX6V7O11EU90KOw5g7u6
         bN6DD3c4PlC8HdqqqhkH9W5TGBBOpdq981K6XzP51ufr4JuB61tDKResJ74TYnR24ESY
         cTVw==
X-Gm-Message-State: AOAM5326BEJ4gS4KVOOqVk+BMNS4Gs5cKwdAPQhU9GT6BAZkqEkF+k1E
	TYd1BqJBtwAXFTAxWTcAleQ=
X-Google-Smtp-Source: ABdhPJyD4dRXQpY85ssRFCE8v1mSl/0QR8h2yF5BwpSNP0u5z+9EM62TKZRSwpmafayM8jgnpOo6gw==
X-Received: by 2002:a17:902:e845:b0:163:ebca:a025 with SMTP id t5-20020a170902e84500b00163ebcaa025mr58149773plg.81.1655114044566;
        Mon, 13 Jun 2022 02:54:04 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902e9d300b001639f038250sm4639754plk.220.2022.06.13.02.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 02:54:04 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 3/4] ARM: dts: aspeed: bletchley: bind presence-sledX pins via gpio-keys
Date: Mon, 13 Jun 2022 17:51:49 +0800
Message-Id: <20220613095150.21917-4-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220613095150.21917-1-potin.lai.pt@gmail.com>
References: <20220613095150.21917-1-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Patrick Williams <patrick@stwcx.xyz>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Bind presence-sledX pins via gpio-keys driver to monitor and export
GPIO pin values on DBUS using phosphor-gpio-presence service.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../dts/aspeed-bmc-facebook-bletchley.dts     | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index ee33cc3efae4..7b6de9b51547 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -190,6 +190,41 @@
 			gpios = <&sled6_leds 1 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		presence-sled1 {
+			label = "presence-sled1";
+			gpios = <&gpio0 ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(H, 2)>;
+		};
+		presence-sled2 {
+			label = "presence-sled2";
+			gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(H, 3)>;
+		};
+		presence-sled3 {
+			label = "presence-sled3";
+			gpios = <&gpio0 ASPEED_GPIO(H, 4) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(H, 4)>;
+		};
+		presence-sled4 {
+			label = "presence-sled4";
+			gpios = <&gpio0 ASPEED_GPIO(H, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(H, 5)>;
+		};
+		presence-sled5 {
+			label = "presence-sled5";
+			gpios = <&gpio0 ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(H, 6)>;
+		};
+		presence-sled6 {
+			label = "presence-sled6";
+			gpios = <&gpio0 ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(H, 7)>;
+		};
+	};
 };
 
 &mac2 {
-- 
2.17.1

