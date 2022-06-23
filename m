Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7E455770C
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jun 2022 11:47:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTFm92B5bz3bts
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 Jun 2022 19:47:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WKeAx8Rv;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WKeAx8Rv;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTFm25Bptz3bhB
	for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Jun 2022 19:47:28 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id r1so17680738plo.10
        for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Jun 2022 02:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zLej8f+63l565Dfr6TjNR8hNfK9QCTEEzKrEBYkQU5Y=;
        b=WKeAx8RvtEjXLFH4p/djrzpN3idIhCJws1UaFiGpTIn1nHxYhCDGmjcznI37ow2mpZ
         4owRUfRFKd/DzDNaer2j7PvhNMcPioFhEysTHZ3p0qFo8azf932TgaAhEiMHigAj1U+T
         ir+5r7QVxOlgWXIFIAFKUi/lC59GF8jbOXKjDr5VXqJljLkYq/bcYMCVyFzCBQ8a4XVQ
         vS6+g9iQqSjsmUGRKvIHOi7YolkmTX46korg5ygL/RJYJ4myHeZEi1ZdLXJfLm4vy1nV
         DhA5uwunyOV2Odj80kdx+Kj36aFuKfBsLK1DpdTgyMt3C4kbomyCjm4io/BmBE+Figbk
         fxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=zLej8f+63l565Dfr6TjNR8hNfK9QCTEEzKrEBYkQU5Y=;
        b=GBsRkddkhxpkp77VOohrMcjMnJsRWnL3h0UuLXmS1m8bXKzg62c3raDyErnHJyWOFd
         AWZdUbBhJ+31HHBJHvRkobDaxlofbtZNX+XE4uisOKxEQCiSraXF7u2DQRfGjefcmtoI
         Xh2miMsgGncsdbiZD3n6QXavBZ8rxucoRLq9Nppxc9hyhkuOEaUJnEq5YbRMNRAfDkhz
         sQ7nif7VRs5mhBdZYgNxcpSAQHdd8SIWF3K/NswDqNqrH9QcTaP6YjKR3gk8Cqc5TYcN
         3DJ2TlqVN29ewNcv/zTpdfXWrYryk+D7rHO866mpyVU3gOmAFnmhwafpYNxHlbAbUY3X
         zSjw==
X-Gm-Message-State: AJIora+fvgw1721O6OU6m9jXJZssi14Scb1jGniuoYAHRW6V2eSgLtim
	CryHsCi0rA16M+79PRsUdRE=
X-Google-Smtp-Source: AGRyM1tABMRa5ofk2QWQsD4oPb2bKTEGDD2/1JJvEUemizcSXoTgFB5sJ67opoOhE4vBpuB8nw8GNg==
X-Received: by 2002:a17:902:e54e:b0:16a:1009:42f with SMTP id n14-20020a170902e54e00b0016a1009042fmr27516813plf.90.1655977646732;
        Thu, 23 Jun 2022 02:47:26 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id a17-20020a170902ee9100b0016797c33b6csm5530955pld.116.2022.06.23.02.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 02:47:25 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: ast2600-evb: Update I2C devices
Date: Thu, 23 Jun 2022 19:17:17 +0930
Message-Id: <20220623094717.3873328-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The AST2600A3 EVB has the following I2C devices:

 - ADT7490 at 0x2e
 - EEPROM at 0xa0
 - LM75 at 0x9a

The bus these devices appear on can be configured by jumpers. The device
tree is configured with the buses given by the default jumper settings.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-ast2600-evb.dts | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
index 5a6063bd4508..9da70b873ab6 100644
--- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
@@ -207,11 +207,6 @@ &uart5 {
 
 &i2c0 {
 	status = "okay";
-
-	temp@2e {
-		compatible = "adi,adt7490";
-		reg = <0x2e>;
-	};
 };
 
 &i2c1 {
@@ -240,10 +235,26 @@ &i2c6 {
 
 &i2c7 {
 	status = "okay";
+
+	temp@2e {
+		compatible = "adi,adt7490";
+		reg = <0x2e>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c08";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
 };
 
 &i2c8 {
 	status = "okay";
+
+	lm75@4d {
+		compatible = "national,lm75";
+		reg = <0x4d>;
+	};
 };
 
 &i2c9 {
-- 
2.35.1

