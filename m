Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A27239181B5
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 15:06:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nFwo70AN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8MR40mlTz3cR1
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 23:06:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nFwo70AN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8MQR4vVfz3cYB
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 23:06:07 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1f9e2affc8cso41170305ad.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 06:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719407167; x=1720011967; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QMNZrdOhBJtXo/ncaekHBRhjTvNlqY+hHR6bexm0Kg=;
        b=nFwo70ANAisl2fAxB4n0h/U8V7ZhH5Kr0I28eBcj2Yh1vV67K1j2WT0byGHA4n3SWX
         8iHDnRqhzrZt28GtW1CULqvmS/EtL5eTBs8GR8odsbPGODQFD+pcR9LMd50vskxYSpC7
         iCXFDigIuzPF6l5K3vbTzUjoSfvQ5pli7TgpW33F4JgNRudof4jvFZ0IWHbf3Gp2DFKm
         x5g3VvvqQnBV7PCcwmsE+a9h6W72kanohQUw+kFF9jRS48Vg3izKcvlLaTnalYtbJ7RY
         J0r/q/KGUDumhKIpkpn4ojmonW/mLeP38O3JHWd0UJMVzQWM4n87gcTk6njZQajBjlxb
         rDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407167; x=1720011967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6QMNZrdOhBJtXo/ncaekHBRhjTvNlqY+hHR6bexm0Kg=;
        b=d3cXIi6Z4az56juoJ47Y5OwlgSjTBrwsWwCwo+9OzpymlnsrVWVZci7MQRvrQDfa3Y
         hV63jzCzSsqJYa81oYQpdI99xqL1AfGOVux9IbW+pt0hLKN2/g6jseioYKXNMtxF9MCm
         ipn4Kc62LBO569VCH0OGmwohs91vu5R9QC1mWgeRaDjBtO3Jk4le12kUfOiSD5qQguix
         EUAAO4qdRU5SpamFFob7qdYCIp6jnBb0sFvgj+RquCtpRlym3QTyFdCSWRc1pXl1Lh6N
         2BmSOLkjvdGQ4+VN8wABgIw3nwspuA2VDZkdtRh9qA4BowOW799Xq9di7rrNET0ZYh8l
         D6hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWngqVdwtC0cOVSpyFyKgG2SEt+FRhlKulzyufIDq4x7sKnJGISwcRtzkveZnDPeup0vRrh61vUC5rBVemhnGnkhrsg/V1+QAH5Fmtakg==
X-Gm-Message-State: AOJu0YyMtixC6Z0tLE94KcPvAmZLC6EGTS+m1ru9fdRlaaCCAsjgEVMd
	wJDR0J4WHtNBCdpC3O3sNwdUKW889RcA5O1HoL1DeHiKEJwnNyGD
X-Google-Smtp-Source: AGHT+IGXLyzlC236sq7iVFAmdM7iFDnu3HHVf2NPqgOoGr1Q99dC/Kt2LUa8EVydJPm2vIe9lGvA2A==
X-Received: by 2002:a17:902:d483:b0:1fa:2270:450d with SMTP id d9443c01a7336-1fa23ee0fd9mr106842485ad.27.1719407166681;
        Wed, 26 Jun 2024 06:06:06 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb7cf885sm99112395ad.224.2024.06.26.06.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:06:06 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 12/17] ARM: dts: aspeed: minerva: add power monitor xdp710
Date: Wed, 26 Jun 2024 21:03:27 +0800
Message-Id: <20240626130332.929534-13-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626130332.929534-1-yangchen.openbmc@gmail.com>
References: <20240626130332.929534-1-yangchen.openbmc@gmail.com>
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
Cc: Jerry.Lin@quantatw.com, yangchen.openbmc@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Yang Chen <yang.chen@quantatw.com>

Add HSC xdp710 on i2c bus0.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 3d80993885b7..0c305ddf7011 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -154,6 +154,11 @@ power-monitor@68 {
 		reg = <0x68>;
 	};
 
+	power-monitor@43 {
+		compatible = "infineon,xdp710";
+		reg = <0x43>;
+	};
+
 	leds_gpio: gpio@19 {
 		compatible = "nxp,pca9555";
 		reg = <0x19>;
-- 
2.34.1

