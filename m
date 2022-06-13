Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C25AA5483C3
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Jun 2022 11:54:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LM6NQ01DVz3c7p
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Jun 2022 19:54:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Z7e+Rur4;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Z7e+Rur4;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LM6ND5ZN1z3bkv
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Jun 2022 19:54:04 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id i1so4665606plg.7
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Jun 2022 02:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YNhd/FL425kRzxrVXJkEkRoau5KOg53TFkVnNDFPTbE=;
        b=Z7e+Rur4inXUcXgthnaZ2pFOzXXfJ4X9KNFxNHhLbA5Qgu72efS6R7e+aLk46rVlvU
         LzIIcs0bLiuAz75WUXtqcngkZtE35Yi+nB3KDs/BczEiMc0P2S1XEFu8LxmXJa4QH/DX
         i/yv0BZL9zlbn+i0dsx/u9YGmKY0I75MmH2TWYrbU4VdlxWIbpuWfQghvNTe3SYgD217
         eCOQ+F+7nfqe5tDizUYOyZVEdNBeT75E6/TpI/XSKM3m+TG/11YpBoxmNonTeXmgRTzx
         +KcySB4bijDlaHEBcS+qRXOrxsArCUoW9dvnRtJV3SVJ5YiiNqIYfD7Fz+6hPHDnP8DA
         JKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YNhd/FL425kRzxrVXJkEkRoau5KOg53TFkVnNDFPTbE=;
        b=fLvFzEfIgTt2n+VovoLVkXgQtmqb+hq5Vnpvt2ss6dVCoPqAorEop54NQeP3yS2zOy
         ZJsNF00W8U/gUXaUVtLZinkMgcMbIVun2I/p7PoZTLcsoAkX4B6GvxIo5M/o8iB9djym
         i2YwZ4pLmXuzm/vnY9JCbr/DZMyqv+TUdsCykhqEyhM6YYDwUD9MydFg9gATOl0wFcr8
         aURzzoJlJ/lMDeq469zqTKX4GEC+vuwKOZnvI7giMEYzGCLt6xzusB5CqSeZeFC2lHEx
         x/UUK0gD/MiicwmGANAxhElHCbu4uT+TnQ5dHw32qyOLHG2KPGZ1YU9jHpOK/m7o4cnB
         FqBQ==
X-Gm-Message-State: AOAM5331+b/PukmwkcAcPh3K3w4RKkMyrKiNwHz1tz6EjX8y3GcpZH0T
	fNKxe0xqI7u5cpgXfZflhzhNYRlxQz5I/gpg
X-Google-Smtp-Source: ABdhPJznuSGMGqWN1zmUDGm+Kr7nnDXOF2Q4rVuh1OdEp2S2Y4/rSDjXL8ek0riyUPHc6euHt2GqeQ==
X-Received: by 2002:a17:902:d481:b0:167:770b:67c with SMTP id c1-20020a170902d48100b00167770b067cmr40584528plg.77.1655114042596;
        Mon, 13 Jun 2022 02:54:02 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902e9d300b001639f038250sm4639754plk.220.2022.06.13.02.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 02:54:02 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 2/4] ARM: dts: aspeed: bletchley: disable GPIOV2 pull-down
Date: Mon, 13 Jun 2022 17:51:48 +0800
Message-Id: <20220613095150.21917-3-potin.lai.pt@gmail.com>
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

The external pull-up cannot drive GPIOV2, so disable GPIOV2 internal
pull-down resistor by the request form HW team.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index d34bfa50620e..ee33cc3efae4 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -860,6 +860,9 @@
 };
 
 &gpio0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpiov2_unbiased_default>;
+
 	gpio-line-names =
 	/*A0-A7*/	"","","","","","","","",
 	/*B0-B7*/	"FUSB302_SLED1_INT_N","FUSB302_SLED2_INT_N",
@@ -950,3 +953,10 @@
 &ehci0 {
 	status = "okay";
 };
+
+&pinctrl {
+	pinctrl_gpiov2_unbiased_default: gpiov2 {
+		pins = "AD14";
+		bias-disable;
+	};
+};
-- 
2.17.1

