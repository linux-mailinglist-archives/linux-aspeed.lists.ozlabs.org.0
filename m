Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F4280E544
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 08:55:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DNuf+5ex;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sq9rN0Rtpz3cJW
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 18:55:00 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DNuf+5ex;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sq9qt6WvSz3c7S
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Dec 2023 18:54:34 +1100 (AEDT)
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6d9dbe224bbso3944321a34.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 23:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702367672; x=1702972472; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JgxFMe8L/6FklhMeqWopx45J66QA9FQNsN0+nuF/AQ=;
        b=DNuf+5ex8GiEtDFX2dCbjPOEM/ANpBNBZJfHmJ8Ns6DdXfk467HUuHwIvRlFkaPtYg
         0Dwpdn5tfKGNBntnWFp1B1lErqBIi91/+q49ErZuL1ZulpU0n0tNa9mpt6pINf8jOLRH
         sExeJTEjSHFx5SZw7IFxda4aM0k4y4tnR4TPKQWT01MrOoZJkj4/j6lwfXbkt1wcIpK7
         nh0+3yWxem5BBmmnPfkT76r5nnqflMQJigHY/7IvjxQ6sXwYFJDNiuLZmWFd2OYXQNeZ
         9MWW8zjOf9Yk/ErL+Dg4f0vETEp6SAkDFMeSfbXZ60lYkMugSsZgfGIes/cdlkDRD9Q7
         Py9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702367672; x=1702972472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JgxFMe8L/6FklhMeqWopx45J66QA9FQNsN0+nuF/AQ=;
        b=p6jfpkkTcKJ/1153o3kfxf2ZMjjXbO3bjJxlp5XrvbVEFSsD6fqgYLmkG2hVsE9GS9
         r4Bnq9VMt8xOqP9ZbPoJsqx6Xg0lU5cTYDJVDUmChUtPU/m5Q1HhKF346buU8ApeRNzx
         J/szohpDXz9NODzhxGImuol8+Xxa0Ce729wxj+V0iiXMB22+9e3EIhHUKRplaTJ/ZhAS
         hIvHlKFYUSUWQWyCW7RXXmfIbZiNd4m9nw/INzOkN7omM05ryoM0zexWxTWKpsrFbNK8
         sHyLDE/GF/FMSpd2qbCZ+QQWsMVewOIAeDjXTKOJCYRiGF69peQQMkhMkIZyhnyZZl3R
         nSrw==
X-Gm-Message-State: AOJu0YxrDmLlqH9k5iZ/ZahrGSV6IqVC6xZt/cyJ3bN0c+HQoF7D5lkl
	beBe02Hhd+5U4xNH5gvDrzA=
X-Google-Smtp-Source: AGHT+IF6A11qdrTxyvRzsn/UfFXLrl7jYZ8gox7osnSr3fygXIiVgtb4DmPpKsxJGZbganWpChvURw==
X-Received: by 2002:a05:6358:515e:b0:170:17eb:14c2 with SMTP id 30-20020a056358515e00b0017017eb14c2mr2899799rwj.50.1702367672132;
        Mon, 11 Dec 2023 23:54:32 -0800 (PST)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id qi9-20020a17090b274900b0028a28ad810csm8144319pjb.56.2023.12.11.23.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 23:54:31 -0800 (PST)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] ARM: dts: aspeed: minerva: add gpio line name
Date: Tue, 12 Dec 2023 15:51:59 +0800
Message-Id: <20231212075200.983536-11-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212075200.983536-1-yangchen.openbmc@gmail.com>
References: <20231212075200.983536-1-yangchen.openbmc@gmail.com>
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
Cc: Jerry.Lin@quantatw.com, Leslie.Tong@quantatw.com, EasonChen1@quantatw.com, yangchen.openbmc@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add the GPIO line name that the project's function can use by the
meaningful name.

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 090fe2f6b1d8..31197183cc59 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -362,3 +362,33 @@ &ehci1 {
 &uhci {
 	status = "okay";
 };
+
+&gpio0 {
+	gpio-line-names =
+	/*A0-A7*/	"","","","","","","","",
+	/*B0-B7*/	"","","","","","","","",
+	/*C0-C7*/	"","","","","BLADE_UART_SEL2","","","",
+	/*D0-D7*/	"","","","","","","","",
+	/*E0-E7*/	"","","","","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","BLADE_UART_SEL0","","","",
+	/*M0-M7*/	"","","","","","BLADE_UART_SEL1","","",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","","",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"","","","","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","BAT_DETECT","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","BLADE_UART_SEL3","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","";
+};
-- 
2.34.1

