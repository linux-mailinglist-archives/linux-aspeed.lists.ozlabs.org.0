Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6C58A2AD3
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 11:18:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SeOm7xqy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG9wd4xFbz3vcQ
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 19:18:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SeOm7xqy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG9wH4RvVz3vbr
	for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 19:18:23 +1000 (AEST)
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6ea26393116so588462a34.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 02:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712913500; x=1713518300; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eE+ArNThktHqxq53xyc4RaWaWv+q0sBFJ+ThRmH5j0U=;
        b=SeOm7xqy9pl2ouWvJXIS5dVajIhsobTS9hAPlIzFGHYFiEWOf1teIxo0kIK5OdWnEk
         qQ4Ae/VMZYeII+F4Ww/kVqM41oqvyl07iNkjFqoI2svzVHzdSu960+AtUvPdZaXKeWu5
         xr8ZEE5bFjuhexmIUIADZWvxohdBRGMFlVAgZ1kvLCcaNsSxznCeqJYzhomCXd7u8Wyb
         +0gB+hB0T8XVnfn+Lh/PmRbiZwI10jHhmIjgdIRNZzFJzYtRivfhNNAnXCyNvJj3R+5+
         AtsPuGnG86V2QqGpB5OoYWMbh0BiF4SrZwlkUPMfC32E/oVt8dEWNCpfdtoIOWQPe42m
         I8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712913500; x=1713518300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eE+ArNThktHqxq53xyc4RaWaWv+q0sBFJ+ThRmH5j0U=;
        b=RuSC/IPMAVtVz+cjNdcVWisvX6wxsoWIUfkW1BN5ZUlPchPLsKapdmpU7Y2zCeqEE3
         +mgcZl8ANcKYmq/GFi5nrt8sUIeIi88w0lcBsy7MJ8jQC/cb4eW+na1q7zvmJipIaRwZ
         /gwiEwVM7ZByJo/nTEhni58p88DLSsaBMmcHclhKMS6Pp9VjgpI9FnIz0Y3uDOvdXvDP
         R1ykThTQ5lsxWG8/LSKum78R54vkSSvst+nZjCD1t7b4Tq31VNo8moHhGxTKi25DYKAt
         qUGrZBuF+b9t3zMNLnb5co8EOG0jmTeMm3l6EHGV+TuIGcBvsz4FzOxqd7ljKmynvxBm
         iV5g==
X-Forwarded-Encrypted: i=1; AJvYcCUJqjE/LxcPieX8xOMzt9YFN8EucGnDZ//1AILH4pICqjknfJkNldobJGio1rRDf4DtxJ6lZUb05ekqzdLoS4RzJf7yIaTO6K2WaDw6zw==
X-Gm-Message-State: AOJu0YxLRIQroWRQ9ssOFz+RxplYaMaEdOLnVbCSUB8P5ZhbEQfSJK+M
	VqQhoQivYN+Z8/YyvizDPVKn57wN621gRfKQoPOrSjjoYX0VAbKR
X-Google-Smtp-Source: AGHT+IGuaPRWNC3+2UCR6QUBGuOjGB9+hyVmpUhpOqmfJLvoBQdvte3clovGToV70M0AqKTeQ7hR5g==
X-Received: by 2002:a05:6808:199c:b0:3c6:23d:ee47 with SMTP id bj28-20020a056808199c00b003c6023dee47mr2247264oib.41.1712913500656;
        Fri, 12 Apr 2024 02:18:20 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id b25-20020a63a119000000b005e840ad9aaesm2332711pgf.30.2024.04.12.02.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 02:18:20 -0700 (PDT)
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
Subject: [PATCH v5 06/12] ARM: dts: aspeed: Harma: Add PDB temperature
Date: Fri, 12 Apr 2024 17:15:54 +0800
Message-Id: <20240412091600.2534693-7-peteryin.openbmc@gmail.com>
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

Add PDB temperature sensor.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index ca3052cce0e0..5c3fa8bbaced 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -203,7 +203,7 @@ max31790@30{
 &i2c1 {
 	status = "okay";
 
-	tmp75@4b {
+	temperature-sensor@4b {
 		compatible = "ti,tmp75";
 		reg = <0x4b>;
 	};
@@ -260,6 +260,11 @@ delta_brick@69 {
 		compatible = "pmbus";
 		reg = <0x69>;
 	};
+
+	temperature-sensor@49 {
+		compatible = "ti,tmp75";
+		reg = <0x49>;
+	};
 };
 
 &i2c5 {
-- 
2.25.1

