Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98346868654
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 02:48:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ty0a3EMq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkL3Z2MTDz3vYn
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 12:48:10 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ty0a3EMq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkL392167z3cVd
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Feb 2024 12:47:49 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1dba177c596so23679435ad.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Feb 2024 17:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708998467; x=1709603267; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hs0kTt521WxQulVTrFgJYAGsV52YNUczVxWl9CdT+ko=;
        b=Ty0a3EMqJl1bb0FHACGUt1KZiZAb0wN+emNd3w0CFLzTaMBO5gsDUhCbnJaePqdqa2
         MK4PmTmymro49Ht6/xnOFUxBttY/yAFFKBF7IOICXo9M5aE2NGM0SpsGNZBPzaDmeAC7
         Mb4gIbLHbRasDrJdESZkxN+BL1ONWhNSaE03IsVspPNXomEvF5qY8yD+Dy8+nMARl7Mo
         UvCNkxZX7mytpYQ4W+nyAHgfxaHdPpXFBvnQNaJGsbT14tDk3DoSfZojSGnqo5ZqTMSV
         tMKoXXXMZ95k4p7gR4lfGGBGgrOyjTEvebNeJHI81fBmj+tQlpiBATXlrQSkWCPKWxO1
         6+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708998467; x=1709603267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hs0kTt521WxQulVTrFgJYAGsV52YNUczVxWl9CdT+ko=;
        b=sX2SLOh6gF7ax6ZpWRqogmQppM/SPlJH4jlk4WvJiGxjr+LFHSTZyDMa0qqJDcy43d
         S7OMHqOjQtT8yOX4pEAcYYGwACPu/1QFy23FQNxHFt2yBmTsca8n/zzC5iUsmf+7nP+L
         rD/kR/VnfAQJ9npW8qV97xyTj025DCtOjrNOYYjkW3ReJMM7riPOWw5HWArQzuLxuwgO
         hT+Py6F63k8pbOuz86aCsje4sa0jTtqqT2hGTseX0YkTvH2+oM+Ztiy4mT2s9lTnnop7
         uVeIg3+ejyV/T3ezOvpqDwsUUeEvoKQcbrvFcrdXjAV1kGmCbiHSy5UY89ONIQxoLKNv
         D27A==
X-Forwarded-Encrypted: i=1; AJvYcCUMf4VCtfu2bsDmxZqIAzKdkSAlglLqN2pLEgdOZRpGuNEWaMThNKP3Nq6IAkHEDfEayHR/lgi3fsC3fDkffgVH0inAEnxmDw2DWFSwBg==
X-Gm-Message-State: AOJu0YxCAb65Yb1Q+IUuj55n19xIWd5fNS4LQSJ/3i/48lAo0CJKEr+9
	ORzri51QeZ7I223IPHWTnR66e2W+LsPHeoqJiJ+IUybm60NDPaEf
X-Google-Smtp-Source: AGHT+IGuCy8bpvvHRwtyY97TpNDqZJzgeQPnK+BX4u53CAN/uvQNpPDyoQQPZHSXZR3chccrAq0OwA==
X-Received: by 2002:a17:902:654f:b0:1dc:15f5:fde3 with SMTP id d15-20020a170902654f00b001dc15f5fde3mr8724505pln.4.1708998467634;
        Mon, 26 Feb 2024 17:47:47 -0800 (PST)
Received: from localhost.localdomain (2001-b400-e381-af24-f369-7cbc-56bf-1d54.emome-ip6.hinet.net. [2001:b400:e381:af24:f369:7cbc:56bf:1d54])
        by smtp.gmail.com with ESMTPSA id kl14-20020a170903074e00b001db4b3769f6sm318893plb.280.2024.02.26.17.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 17:47:47 -0800 (PST)
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
Subject: [PATCH v4 08/10] ARM: dts: aspeed: Harma: Add NIC Fru device
Date: Tue, 27 Feb 2024 09:47:17 +0800
Message-Id: <20240227014719.3037588-9-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240227014719.3037588-1-peteryin.openbmc@gmail.com>
References: <20240227014719.3037588-1-peteryin.openbmc@gmail.com>
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

