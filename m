Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB5B85D3ED
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 10:42:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=No5Nwuxh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfrsQ4gvMz3dT4
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 20:42:18 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=No5Nwuxh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tfrry3RPNz3cgk
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Feb 2024 20:41:54 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3c031c24fbeso224263b6e.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Feb 2024 01:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708508511; x=1709113311; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeRB8Ae3MB3D0N5Amo8nBZXsnfNgL0uq7S0EnYN/MPk=;
        b=No5NwuxhpRiuUniOPkX7ezTFGMNqpMzJHUTqbhIkAQLVFQjueUGtIDU95BzJ9X2rwC
         VvP52ROa/VcPZU0+mKz7jAZiI3jpwRaMEmKE2nAxQWHyzMRJ0MJHwo6d7dBOTzXNwta0
         sX0gmFzITADtgd1luN4Ydec+GG/RTG1TtKDEnyWPXOfzovJ0YTI8fS0vKkYj7Oq35mDW
         m/XYJwzhMnmO95FJKMzrwsIjeRDrHPNoi85jJJo0rlVOZ/mBFJe5A7e3Egf4EkrsrQEw
         HUCUCtB9jxSulnquLJZdKiuFMmwZAOU6sdoLSLeIj1Lyc3tSnbwUOfOIjWKbHzcjVsu+
         ua8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708508511; x=1709113311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeRB8Ae3MB3D0N5Amo8nBZXsnfNgL0uq7S0EnYN/MPk=;
        b=OieciZ4Itn1Iq9X5oC+WzGwdnlbMdbWsY1/fxghpsCjG0B3b37RaTQDH1VE4MrfMy7
         X450WpwKepAHmMxb9mx4+ip1gpGuUs+6F8e4myXwoR0ikIlgTGZcD8oQ9jLCZi/6TyqP
         QZ6o6S/wNlcTpclBRfBa6TfzXUMMnD4P8O52nh1OQ4g2c0JQtQOXoApUFihww79+UnxR
         dMehdEMDJAYiyMZxjiBMdSj3VzWoExF6w/JGgRzphPTR2ebcp14107E7++HDv0vZvtL7
         oFgi2gpPrnANdAkKe+/b5Dy1ulCAl1zJm8AG0Vr27Q3hrY5nVq6PGJk5mUFetr40rWgf
         iW/w==
X-Forwarded-Encrypted: i=1; AJvYcCUxFGdS4R0IIi+p4FIkkw+zjbxz7RzFlMohzveFi+JGEMm82gr2TQE79Lyh6S9cC2LHBg0oJXMW79O8j7hIdEdXRRwUka/LraqAcDTW4g==
X-Gm-Message-State: AOJu0YwOn3EJuJWo/8nE6y4DpmcBwRKMZkMSNLcZv3DtSGE5aTAtRqK+
	QMmT+XGm6f1n6ydTd0QZ7ZiXby2nJ9mIVuEM4SsMSUa0w5E02yXYN8oS03GR
X-Google-Smtp-Source: AGHT+IExxMpSW5KGc7JdiMVfUhTqkZRdgnXU7hINm16MFTbij3Pmc6wBGllC0RqE1D9rQrP1LC1JKQ==
X-Received: by 2002:a05:6808:34c:b0:3bf:fcae:17c6 with SMTP id j12-20020a056808034c00b003bffcae17c6mr16681430oie.30.1708508511591;
        Wed, 21 Feb 2024 01:41:51 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id lm4-20020a056a003c8400b006e488553f09sm1645026pfb.81.2024.02.21.01.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 01:41:51 -0800 (PST)
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
Subject: [PATCH v3 9/9] ARM: dts: aspeed: Harma: Add ltc4286 device
Date: Wed, 21 Feb 2024 17:39:24 +0800
Message-Id: <20240221093925.2393604-10-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221093925.2393604-1-peteryin.openbmc@gmail.com>
References: <20240221093925.2393604-1-peteryin.openbmc@gmail.com>
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

Add ltc4286 device.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index d5c5c5b3ab4b..bbbab8023cd6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -271,6 +271,13 @@ tmp75@49 {
 		compatible = "ti,tmp75";
 		reg = <0x49>;
 	};
+
+	power-monitor@22 {
+		compatible = "lltc,ltc4286";
+		reg = <0x22>;
+		adi,vrange-low-enable;
+		shunt-resistor-micro-ohms = <500>;
+	};
 };
 
 &i2c5 {
-- 
2.25.1

