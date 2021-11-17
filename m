Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CA3453F23
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 04:51:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv89n4phNz2yRf
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 14:51:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=luZo4VyY;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=luZo4VyY; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv89k12rrz2xXy
 for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Nov 2021 14:51:21 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id c4so1376176pfj.2
 for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Nov 2021 19:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WzSybXdz+/I3dC14BuZfdqJl7s7vkON3etX+R3DPSxE=;
 b=luZo4VyYBC8CUPGVXuDJwQLvUmdAw+H6yKtUqcYKi7RS3n0ZJ+9TMEQOzOA5PX/i8G
 mJLyBF2lRYQN+728tV83cY2xpoBPtMh4ybFYoMjkKz9uuxOsggXyiBKkiTj4plIZysxb
 kh/B7LZ/W5+EL6OtOnGw3/p7JK2tp3Qu50uolUj4uDlhthAOy3PXaf/yse5Hruwi824n
 61C6ZhNpPMMgj9d1YpdJMO+R5jso3dbfZ0ie4Nj2qBH5BH5uQSks30Uh1obfzXIYezYn
 RojJMieYIjOYLRbGTcwwcXPfYpPVohH6ZZ85FUrwoX+YtQ5EdMzQHMGiJvd74SetJDVb
 Y7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=WzSybXdz+/I3dC14BuZfdqJl7s7vkON3etX+R3DPSxE=;
 b=zcePPOfwA0/kT7zxUqpXoJM94ELDEGF7RKAQia+O4hbO3KnXAxUt/mPz5oDdyQcCZN
 2p6Jz6ZYDfq0ULbYoKe8MrGotI6PbGZwBgZACZ3f01YDkvxQL/IMAfJORItNb2vSMB4o
 37HWMe4NInQBOraiRMF5nLIXaD/xh36srldoBn0Ks3XZNBrBQ5UyHqDwlPDb50yzqJVz
 tVFYBU2mhPmjvmo87I2ccbTHnyPbXDf8ggKJOSeko4fGBI6OZTt7lrGgpIaRjgJxjFbJ
 cT7xVZ4p5IOUM36f4jdvJHYMvxFR2by+bLfeOb1VL7DqPMfHynJdtgrSYUiyNYaq/jQV
 CF4w==
X-Gm-Message-State: AOAM5320By2zWdefsUERUyU6A/T+/6Noxn0blsD9Q8RcIGkjKrv/pG+P
 jy1rrYauce/W74A2ZiEPv1E=
X-Google-Smtp-Source: ABdhPJz0m1icuDtyVh7PGhkuRAeOD7/GMjM1g5aNuCIcyN01SKDRPmI2TqBUQsimakr1Jz9TJvmaIA==
X-Received: by 2002:a65:6854:: with SMTP id q20mr3097449pgt.38.1637121077964; 
 Tue, 16 Nov 2021 19:51:17 -0800 (PST)
Received: from voyager.guest.fluxperth.local
 (210-10-213-150.per.static-ipl.aapt.com.au. [210.10.213.150])
 by smtp.gmail.com with ESMTPSA id c15sm3671339pjg.53.2021.11.16.19.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 19:51:17 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.u>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/3] ARM: aspeed: Secure Boot Controller support
Date: Wed, 17 Nov 2021 11:51:03 +0800
Message-Id: <20211117035106.321454-1-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This adds the reporting of the secure boot state to the ASPEED socinfo
driver.

Joel Stanley (3):
  dt-bindings: aspeed: Add Secure Boot Controller bindings
  ARM: dts: aspeed: Add secure boot controller node
  ARM: aspeed: Add secure boot controller support

 .../bindings/arm/aspeed/aspeed,sbc.yaml       | 37 ++++++++++
 arch/arm/boot/dts/aspeed-g6.dtsi              |  5 ++
 drivers/soc/aspeed/aspeed-socinfo.c           | 73 +++++++++++++++++++
 3 files changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml

-- 
2.33.0

