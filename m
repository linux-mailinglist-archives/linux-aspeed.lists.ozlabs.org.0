Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D08A68A2ACA
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 11:18:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eOmyWU7P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG9wC4NtRz3vZh
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 19:18:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eOmyWU7P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG9w24Xbzz30Pn
	for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 19:18:10 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6ed5109d924so674762b3a.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 02:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712913488; x=1713518288; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9gw/r9/c3rfzTKOctHkkj/jJp3NoZ5uGYQMJ7KvSBg=;
        b=eOmyWU7PhOHq67Hzwvb2y7yd5ScB64nwVUTKspEeKzDnw+eartB9PRWf36zceNMeXh
         2QXIiCVFZQI2lmJ7lUpTlsWlC/0h653JvFbBmRf+ou0x0l9KnwNj873G22Q2PFqHErgD
         GbgKds/17x8CQS3Jd6Cqm8dlhJHhTaZ8ju6q/mTWjNn+Uixf6LWBdGmqzUyqXqC86X/G
         4874TfRlX60vxlLgiJwySmdyfln+7SKFspKH2v5bLvVC7J31Zjlk0zD+HjEiI7Y+LgJo
         uS++Sp6vpt3BpW7LgztSnroDB/08068pyFN5DByfhICK+vhG5YjQAjtyKmfUQOcvVQ/Q
         C+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712913488; x=1713518288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9gw/r9/c3rfzTKOctHkkj/jJp3NoZ5uGYQMJ7KvSBg=;
        b=sKqpTsgcQrULm3HrU7yb0eIKwzEEvqfjZ1ZF13CJK6yTYrsHqXz+vZddE+lhXHPo/0
         YILW65+4oJrNUjG4adXtvtt7yDoXkr5kec+arWhPC+G77oL1xOEDlP/mPHpveU2lIDcb
         6JTwmEN2B7ZJNSe1RutstdQfmqaDkFPHVjQGFh6pV7Z7jpFIVFVhObeKzXER49Z8ytdV
         L0DOPoNDAeYtdtEpQFq0q8c1ByxE53j1KC8koJt39l0hu8DKJttMQMMzDvd4B/P5Jngf
         BndYZbGzbnUcnRmGuF/hflT5kh4PAoMvSrKHP8DwQxLkBy7jwPDtePUbUPo93BVpaC++
         k0/g==
X-Forwarded-Encrypted: i=1; AJvYcCUJeLle7X30CBcgTnKOk+2BJS6e2cuc6b/QZyLaqm0j/5xJiw39vfqrnf9wgEpgevXcOGTWZUV6rVpWDtWAzBE2LMtImkumJVCrBqaKwQ==
X-Gm-Message-State: AOJu0Yz2aTqxCMu8oXZgxKu0E1A/8wWrFuOcny4LA40vT1i4hLZPJ24p
	GiDS5CCp5hvNRY+rcYfcboz35x2p45XdwgwY+9fCvIzwrv9IBfSZ
X-Google-Smtp-Source: AGHT+IE6BE5us6WituvhqAzwCK8bMxEiztNY2ednF+FJg33Ns5kiepLJL7m+WKtePVeLcDcoLpp94Q==
X-Received: by 2002:a05:6a00:4686:b0:6ee:1b6e:662a with SMTP id de6-20020a056a00468600b006ee1b6e662amr1608206pfb.32.1712913487570;
        Fri, 12 Apr 2024 02:18:07 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id b25-20020a63a119000000b005e840ad9aaesm2332711pgf.30.2024.04.12.02.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 02:18:07 -0700 (PDT)
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
Subject: [PATCH v5 01/12] ARM: dts: aspeed: Harma: Revise SGPIO line name.
Date: Fri, 12 Apr 2024 17:15:49 +0800
Message-Id: <20240412091600.2534693-2-peteryin.openbmc@gmail.com>
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

The same name as reset-control-smb-e1s
change to reset-control-smb-e1s-0 and reset-control-smb-e1s-0.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 7db3f9eb0016..8a173863ef24 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -505,9 +505,9 @@ &sgpiom0 {
 	"","reset-control-cpu0-p1-mux",
 	"","reset-control-e1s-mux",
 	"power-host-good","reset-control-mb-mux",
-	"","reset-control-smb-e1s",
+	"","reset-control-smb-e1s-0",
 	/*E0-E3 line 64-71*/
-	"","reset-control-smb-e1s",
+	"","reset-control-smb-e1s-1",
 	"host-ready-n","reset-control-srst",
 	"presence-e1s-0","reset-control-usb-hub",
 	"","reset-control",
-- 
2.25.1

