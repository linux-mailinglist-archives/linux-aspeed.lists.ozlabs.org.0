Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F8190769A
	for <lists+linux-aspeed@lfdr.de>; Thu, 13 Jun 2024 17:27:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EoylRMPK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0R9F5BX9z3cbg
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Jun 2024 01:27:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EoylRMPK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0R8l4rmsz3cXl
	for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jun 2024 01:26:47 +1000 (AEST)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5b9f9e7176eso583531eaf.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 13 Jun 2024 08:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718292406; x=1718897206; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IeJnC3t034+9p9rSx5xKrlrprvLjTGHeh2PdENFmyOg=;
        b=EoylRMPK5KYH9EfkQY56bATWEjNnGRRXUtWWY9AyRZKEwK6CoLqUJ8f4saewBhovOc
         JloAy6XXtmMuO1nV+WWyfZCPIdW6tnZwhu3E2Pdmg+Ull7JAmxBVkbUxy3ZHq2hkLJJe
         D+bHYbEL8/fraVUuZD+/LekcyXlOLNWrNQ85hPIhLR+N3nN3e7biEOpxZn1//6CcljDU
         UhuK2FABpTwO9iNMDiq4JVQy/rZSy4FygaQYM7uQ630n3JUOEgW/FwDDCGZ5BkWNSMVF
         0Qtid1zcxn/UGQvzgy/20JyiY6S/j05j/xgd2mdPe7pI9uIZE8Ruydnd4VvQReRVXBrW
         Z2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718292406; x=1718897206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IeJnC3t034+9p9rSx5xKrlrprvLjTGHeh2PdENFmyOg=;
        b=F20qIngn7JW6iCCQhRFQC7/iTtLcLZUWHMrw7n7E9HkqsawdzKzh/ZO89Y2faxVjog
         1SnI1/xu7QFfS70Ae+iCT+pbePApOp8bB9hnWmipMvj5cAhIFNybTDlbKUkcVINWf+Ij
         jJytpMBM2c7UwD+kLL6QUut1Rf7yrMrFsdTXfqHdBVR1Ynd5KXXufAM1r4waBHoJzFa7
         Hjikl5LK7xU1ezhn6hQbupTwqkUVanjlSgeFVELWbPIW0gkLn2SW6GiMfAK85zrJBeST
         8hXQznpYtk3R3Oar9af+Gn9MPmY3kA+4DQypiYkhdlRHsCgVjd86Ju81GSXdrPa0PeO8
         YBCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMurgZX9Ii4bl+GUplbdW6lNW1jFRdQfk7eMAj6OvyEkHaqzhQNkRrc48Y4VMIcukH56f1+K1WU6sH6xm2597KUQoajQtvpWyNCUwNSQ==
X-Gm-Message-State: AOJu0Yyt66KRZTSyLcDvVS7Fjs2Vw3yAMjvnPQckPvjHbqgM5E1VohYf
	zcflSXT6qipXRk3cjQ4lixAktDal3GuUfCLZswP5GsCmJzTYy8QS
X-Google-Smtp-Source: AGHT+IEM96x99wYwHBRD1XqHFCoVr0ih47Cs4Z7Vc7NT43TO7JrVyAEPapjNJXdZkqyzlOcT/Z+kTg==
X-Received: by 2002:a05:6358:6f02:b0:19f:3ee1:d1b1 with SMTP id e5c5f4694b2df-19fb5039c8bmr7747655d.31.1718292406467;
        Thu, 13 Jun 2024 08:26:46 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fee41663d2sm1198183a12.92.2024.06.13.08.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 08:26:46 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/7] ARM: dts: aspeed: Harma: remove multi-host property
Date: Thu, 13 Jun 2024 23:24:24 +0800
Message-Id: <20240613152425.1582059-7-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613152425.1582059-1-peteryin.openbmc@gmail.com>
References: <20240613152425.1582059-1-peteryin.openbmc@gmail.com>
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

Harma is single host, so remove multi-host property

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index a9caa66a59da..d892e646fced 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -137,7 +137,6 @@ &mac3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii4_default>;
 	use-ncsi;
-	mellanox,multi-host;
 };
 
 &rtc {
-- 
2.25.1

