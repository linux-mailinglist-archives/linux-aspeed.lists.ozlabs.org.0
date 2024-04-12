Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A528A2AD7
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 11:18:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Eu5/rsHL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG9wp1P1Yz3vdR
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 19:18:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Eu5/rsHL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c32; helo=mail-oo1-xc32.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG9wN6pjJz3vcR
	for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 19:18:28 +1000 (AEST)
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5aa22ebd048so511522eaf.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 02:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712913506; x=1713518306; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hs0kTt521WxQulVTrFgJYAGsV52YNUczVxWl9CdT+ko=;
        b=Eu5/rsHL/1HJ+Dl4I06ihtXT9fnFY+DvSTZ6OovzZKwpdTVCsf/twrd27J4Gti3Z4H
         esYq/QNpCcddvh/RkxyGnhKCzLv+syCayBgEhcw3rvkSx1xFatH6oRe33annInvuRiRm
         /vRZyL4X6g9DXxnzWR3qrsYMFLxxI2U3dhNeirS4QQmzgHtkbGGryYQXXBEgu7MKsUOl
         QOWHD7sVnhF+bycz1j5hQB2c/AsYprp91Qb5jQ6CVSVSAcCnG8RQLLO7JaMFrCxRQ4l+
         GJ2C86zDXL8tQ2baUYOsYnOsfMHdPxSvHYMFBuKA+zsEDrslnn4f+bs6lCQ0mdB+MfAA
         6WEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712913506; x=1713518306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hs0kTt521WxQulVTrFgJYAGsV52YNUczVxWl9CdT+ko=;
        b=UYtPBOaHAHaNYyLuG9vohh42dQyscqItsxPryp4Uz1QHEJEo2xtB5D3AzYAixDG+wa
         ZvBIYCI90rvfZmSlV6n58/zxHPJviwmGeTt6hzcWWNMMfwSEriFQenp6002N4KCcx5JV
         6u2ZqIXQdFo+/quxIvZpEbJzkqFiDjiQ30WBx8+zJV8+e9mku1utDC9hCRtzMnUHj4Wu
         konjtylz4zykhzLmk+xHYy6oDais5JECLyQQKl24TcjuTcwPAFZUaDWkHCkI0aMth057
         tICkWcRGXjWvMTMAa3w/1O2/IPMUFUdvgQ1vMPb5ub+hp/ptXjhhqpnvP30pTMwBwQQq
         KT/w==
X-Forwarded-Encrypted: i=1; AJvYcCUVsQbZjjnhgJXXasHfKUYLxJ+CLoIKmGuyz3Dn3Z+VZkorKPRY2yhiauYdJjFwVBd8/ReGVindVJlpEQnh/rrFucb902P9QfZ9WqRfZg==
X-Gm-Message-State: AOJu0YwC985f3dnhUvc8mewjRSYOOkM9BZlV56cWvNOP0H4XBzLJ0S1V
	qJm4wGx/jHqRw0Xbn+b6oziKbV3JxfHZX4/APDiGTJtfUq9SZcU3aOhoMA==
X-Google-Smtp-Source: AGHT+IFPaoFMQ3pSNr8OKGxksHpnsLzy0ObJfgdGfnPuEiUxvrzSOGBsWdlo6ujZAsQCPVKC5l735g==
X-Received: by 2002:a05:6358:2889:b0:17e:7c4b:bb56 with SMTP id n9-20020a056358288900b0017e7c4bbb56mr2098863rwb.15.1712913505921;
        Fri, 12 Apr 2024 02:18:25 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id b25-20020a63a119000000b005e840ad9aaesm2332711pgf.30.2024.04.12.02.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 02:18:25 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 08/12] ARM: dts: aspeed: Harma: Add NIC Fru device
Date: Fri, 12 Apr 2024 17:15:56 +0800
Message-Id: <20240412091600.2534693-9-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412091600.2534693-1-peteryin.openbmc@gmail.com>
References: <20240412091600.2534693-1-peteryin.openbmc@gmail.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add MB NIC Device

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 7e98af5836cf..6e9e6e559838 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -207,6 +207,12 @@ temperature-sensor@4b {
 		compatible = "ti,tmp75";
 		reg = <0x4b>;
 	};
+
+	// MB NIC FRU
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
 };
 
 &i2c2 {
-- 
2.25.1

