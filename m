Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5950E7B7A3
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jul 2019 03:36:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ywy30rDwzDqW2
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Jul 2019 11:36:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--osk.bounces.google.com (client-ip=2607:f8b0:4864:20::c49;
 helo=mail-yw1-xc49.google.com;
 envelope-from=3f_baxqmkdooaewsaasxq.oayxuzgj-mebqqpxuefe.alxmne.ads@flex--osk.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mXq/CPEu"; 
 dkim-atps=neutral
Received: from mail-yw1-xc49.google.com (mail-yw1-xc49.google.com
 [IPv6:2607:f8b0:4864:20::c49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ywvN2gzXzDqYp
 for <linux-aspeed@lists.ozlabs.org>; Wed, 31 Jul 2019 11:34:18 +1000 (AEST)
Received: by mail-yw1-xc49.google.com with SMTP id c70so49287585ywa.20
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Jul 2019 18:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=9WyeISlJbiUqrCi6lFo17ItZ78ZU9RlgShR/IG9yUJA=;
 b=mXq/CPEuqMDu0oIi9GtioUwgQhFYYXBa0hdekWBzdp0yCnJJ7DbS9jaNo60B3qKCR7
 qsT61/wZ0l6cmPbvbe5Aih0EFrVDLvjjosva0udh+6Da7VwnRYteG41fwBZQL3iNpR2z
 RvkiNCP8n8xlibPCrXKA5UwjIOIZ1usTt2tDib6f1FK1uqL87giFZeku/1l/3DnPT+2J
 u5rR5gu9XyM9TIs8Jx8S7hOV7EC7re542q3mKRsbzNMEl6FDTa3KGrgMPghTOBEGpl6o
 QrWScx1d5e0MOMwrfz5EQejoFEQYdpfRyJIGmIz7SPwMjSZpaxldkeOmcOkdOiv+9pPy
 rdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9WyeISlJbiUqrCi6lFo17ItZ78ZU9RlgShR/IG9yUJA=;
 b=QL/0mmZOLZTYL/7eVa7hiX3hrC7CxTttVoHaO17iuZIpo6pzg0eHno1L0LqmmXDSiI
 Q01j/teeGAQncGI5qJdfQNpu5k4yl6ojo9xB1tqGyD93DeyjDiwVHyzOqF5safnwfXFd
 a7JOhskqjgVVfBqHFiy6DEOwUWXkUV8wU288fT8x6aeuxPIG5vA2RGaRXaD8BBT6Of6L
 MzTsPnpQ7/c4dPyA8SkcI0X0koZ6NP42kEod6kXoKo99QuF8JcDhC1WwdCBTJj4SM301
 awRtLLWQCJWmDjYoYjGmkF+lT0iw6LKj1dohivqQa/0uMF0uhT2CZaoQRdoaVz3mZS5U
 BUyw==
X-Gm-Message-State: APjAAAX7weYgxbl+xLelDD5yJEOqaz0chEAf7qJ76QqLcTcYLklNTWnT
 6zE4nh3lSHkWFc0Izd5BhFFuDdY=
X-Google-Smtp-Source: APXvYqx12g6sWicwLbqnC2MIrYvaN+A4d84GFJX8U3/Pdr4ImsFo9hfnHfACqi3plJ0YfhNNlFXRjJI=
X-Received: by 2002:a81:a453:: with SMTP id b80mr71139020ywh.485.1564536855530; 
 Tue, 30 Jul 2019 18:34:15 -0700 (PDT)
Date: Tue, 30 Jul 2019 21:34:04 -0400
In-Reply-To: <20190731013404.243755-1-osk@google.com>
Message-Id: <20190731013404.243755-3-osk@google.com>
Mime-Version: 1.0
References: <20190731013404.243755-1-osk@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v2 3/3] arm: dts: aspeed: Add vuart espi-enabled to
 aspeed-g5.dtsi
From: Oskar Senft <osk@google.com>
To: joel@jms.id.au, andrew@aj.id.au
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
Cc: openbmc@lists.ozlabs.org, Oskar Senft <osk@google.com>,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Enable auto-configuration of VUART SIRQ polarity on AST2500.

Signed-off-by: Oskar Senft <osk@google.com>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 01ffe70f64d5..9e561504042a 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -351,6 +351,7 @@
 				interrupts = <8>;
 				clocks = <&syscon ASPEED_CLK_APB>;
 				no-loopback-test;
+				espi-enabled = <&syscon 0x70 25>;
 				status = "disabled";
 			};
 
-- 
2.22.0.709.g102302147b-goog

