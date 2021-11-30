Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FEB463E01
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Nov 2021 19:49:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3WTl5BGbz3bXj
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Dec 2021 05:49:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=eoiEVlkL;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--osk.bounces.google.com (client-ip=2607:f8b0:4864:20::b49;
 helo=mail-yb1-xb49.google.com;
 envelope-from=3jhkmyqmkdlujnfbjjbgz.xjhgdips-vnkzzygdnon.jugvwn.jmb@flex--osk.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=eoiEVlkL; dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3WTh5brmz2yPj
 for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Dec 2021 05:49:11 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id
 s189-20020a252cc6000000b005c1f206d91eso30928141ybs.14
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Nov 2021 10:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=KC1KslsAWcLKbueuly8tNpIr1XMybfLtjcHTyhp9kPA=;
 b=eoiEVlkLUz8iLCc3q+yUTxvA+3ZF7VsDhtl4WNZsBLzc6K46xzxSsjbsJD2C/tUHQu
 hn1szDmsYDQEtq4mVVsib7hSyrVVtFUHOJSMktoUe0M9QwqANtBjEzFHCYFOlQohZlb2
 5V1qSXN0RYsQe+2wNIcWm1OBS+pLNVRZUErpC1A+gDCf/ym+cIRx7gmDsg8Gt9X00Cmw
 S9tsr0LIM5s5DUGziknCita87jgmV0kvP4+Zuoe0ZB0PfsGX4cinsHwwz+9yuxPi8wB5
 Dm/KpffAoPLZyqeBhsP02HHxIQDeavUkd0f3aiCzPLLVcb4ifSEkagflgH4726bZx6v8
 9SdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=KC1KslsAWcLKbueuly8tNpIr1XMybfLtjcHTyhp9kPA=;
 b=7M4YNUmqgd1XZkGfGL7UDp336c/CCFPNPepI0ihiaJDRxdMm6vZicqlQXqObUqyODj
 m5ERen4ij14GNbJQKmzbP7/FIhE49O0q8QKKcuQb7n7ikg1yjI7JNfugxzGj4x3lfDp2
 w1fB34YGn9e1/llcEjC7GwieHhgO+V23KWLJ945q0UKdkQGtL1AQCzvEPdhp+r/E3Ukd
 g7qArSRS1ldQ+jvqSMF/v9J1LOXA1vxIG/Gua5mzOkFoHFSUNvh693/CPbu4zKfgmJMI
 ++ANoLtK94tQ/iDbaRJ10ODymPXDsPFS4OCfLnQXKg/oEsjdUllMWytefWURPT7no1gU
 W5Yg==
X-Gm-Message-State: AOAM533Qcob2UpkZxAoe9SMamquFcJT1gUoLunpfPqs3AkwuNe9zaM5T
 /U/jp+HqINLqCYXup6EGP0Oyeh8=
X-Google-Smtp-Source: ABdhPJywuox5pRKXk/NzXZXHKmmoDVKC5pZnFGHOmy8w2yLDI/QOrQVy8Knol8P4jpbS+i0jDk7kXL4=
X-Received: from osk.cam.corp.google.com ([2620:15c:93:a:bd6e:e7b3:bbdb:f3df])
 (user=osk job=sendgmr) by 2002:a25:9781:: with SMTP id
 i1mr1064086ybo.638.1638298148193; 
 Tue, 30 Nov 2021 10:49:08 -0800 (PST)
Date: Tue, 30 Nov 2021 13:48:55 -0500
Message-Id: <20211130184855.1779353-1-osk@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH] ARM: dts: aspeed: tyan-s7106: Add uart_routing and fix vuart
 config
From: Oskar Senft <osk@google.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: aaelhaj@google.com, Oskar Senft <osk@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Configure the vuart in such a way that it does not inhibit the SuperIO's
UART from functioning correctly. This allows the same DTS to be used for
both configurations with SuperIO and VUART (depending on the BIOS
build). The decision on whether to actually enable VUART can then be
made at runtime.

This change also enables the new uart_routing driver for the SuperIO
case.

Signed-off-by: Oskar Senft <osk@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
index 60ac6d3f03b5..aff27c1d4b06 100644
--- a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
@@ -3,6 +3,7 @@
 
 #include "aspeed-g5.dtsi"
 #include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "Tyan S7106 BMC";
@@ -127,8 +128,23 @@ &uart5 {
 	status = "okay";
 };
 
+&uart_routing {
+	status = "okay";
+};
+
 &vuart {
 	status = "okay";
+
+	/* We enable the VUART here, but leave it in a state that does
+	 * not interfere with the SuperIO. The goal is to have both the
+	 * VUART and the SuperIO available and decide at runtime whether
+	 * the VUART should actually be used. For that reason, configure
+	 * an "invalid" IO address and an IRQ that is not used by the
+	 * BMC.
+	 */
+
+	aspeed,lpc-io-reg = <0xffff>;
+	aspeed,lpc-interrupts = <15 IRQ_TYPE_LEVEL_HIGH>;
 };
 
 &lpc_ctrl {
-- 
2.34.0.rc2.393.gf8c9666880-goog

