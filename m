Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B2985D3E5
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 10:41:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C6jlbcnu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tfrs05BFkz3cZL
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 20:41:56 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C6jlbcnu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tfrrj3nsgz3cTT
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Feb 2024 20:41:41 +1100 (AEDT)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6e45dd96437so697414a34.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Feb 2024 01:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708508498; x=1709113298; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mmt0UdSDV+w1BWZtmNFxfAxPy3KjCbVYZPCzBNdDlQ=;
        b=C6jlbcnurmR597hHTUHctjWZWEH5mS6x+CZE/8M1hLXzdyr1Mw7UCfOYw5fk4SnN3w
         uNmnGupcAkaLdKPo020Ekxkf2AxuZ4hndIr++pikKnyL3khQnYuQ51t9TrtCWWN6iCUY
         /UUvOkZYfrp2S/EMHsWeqa6or0lj6DgWt4SqaUyZIY0kNV85VL0XEEG346KOKePsUY49
         crzJ5JigeOV1YVYJsSmGGDgNuWqr1329hnkCweoigG7feiAIl+TUF/MuoaqEbkrRdRw3
         wP76551KUd6/XCypqq+IuS23t4aqSTfYBZUSCof3rcJ6SfJaywDkfdwqHS+a4omA8vpW
         NAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708508498; x=1709113298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mmt0UdSDV+w1BWZtmNFxfAxPy3KjCbVYZPCzBNdDlQ=;
        b=w7lvbh0DQf8miwcpuxA8Uw+5NSsUHCvEyZYp3NILt04zmAKgICqiQALubILj/leStl
         eRSySHFGmKn3otnngRvMCV9utXd0MhjGZ29Y1ogTM7e9A0VFI+sT3SzxbFTxYE6zooni
         USR+A0HPD01v6rz10pngnulAMWmmSk1t9lW/NogE0rXH3IzYYw2zSqr1OnJtFs8BjbAM
         2djM69pMGGq/E/0ISnkTfJTR1mE9hwWmZtpsXNbIW6wxzOuLHk2UFqIkQv75CnHrnnKm
         IE5CvPInY41pxkS14t3RK7vQ3BmlrOU0cwFVCWgsFg6tpfBnLQIkieajuJTGgxn22fTY
         fLDA==
X-Forwarded-Encrypted: i=1; AJvYcCUbWT0YKKuYa1WomT5QMzI5fFR4ccBOxw0CSOAzUTLsGJMeKNQmV3FYToInQF8f5c7OlP9sm7TvtioE5EVWl8i8AEfOMJ2NsI5kzM7vmg==
X-Gm-Message-State: AOJu0Yy/72qaFcB7sjk6Hx1dic7Rs1+GFyUPkbyQ3o+nx1UzAwAAw4eG
	QsAU6uKYE0aOVcFj2Dqr2OPLqmNC8W1R1R6xRigBIDW+iKN/bN9k
X-Google-Smtp-Source: AGHT+IEk23OMsphGOr3JIPpvQ/UoYj7rhWxmPqSYMwm4auZh3476JgXP6t5EO6mFZnThL4axuTIY/g==
X-Received: by 2002:a05:6358:786:b0:176:5cad:a2e1 with SMTP id n6-20020a056358078600b001765cada2e1mr20693946rwj.26.1708508498311;
        Wed, 21 Feb 2024 01:41:38 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id lm4-20020a056a003c8400b006e488553f09sm1645026pfb.81.2024.02.21.01.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 01:41:38 -0800 (PST)
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
Subject: [PATCH v3 4/9] ARM: dts: aspeed: Harma: Add cpu power good line name
Date: Wed, 21 Feb 2024 17:39:19 +0800
Message-Id: <20240221093925.2393604-5-peteryin.openbmc@gmail.com>
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

Add a line name for cpu power good.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 5d692e9f541e..36aad01dda20 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -501,7 +501,7 @@ &sgpiom0 {
 	"","reset-control-cpu0-p1-mux",
 	"","reset-control-e1s-mux",
 	"power-host-good","reset-control-mb-mux",
-	"","reset-control-smb-e1s-0",
+	"power-cpu-good","reset-control-smb-e1s-0",
 	/*E0-E3 line 64-71*/
 	"","reset-control-smb-e1s-1",
 	"host-ready-n","reset-control-srst",
-- 
2.25.1

