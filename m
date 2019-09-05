Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C576AA68E
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 16:53:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PNx73NXgzDr2s
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2019 00:53:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--osk.bounces.google.com (client-ip=2607:f8b0:4864:20::849;
 helo=mail-qt1-x849.google.com;
 envelope-from=3pr5xxqmkdjggkc8gg8d6.4gedafmp-2kh665daklk.grd23k.gj8@flex--osk.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BtnXfkFF"; 
 dkim-atps=neutral
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PNr51z4lzDqK6
 for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2019 00:49:25 +1000 (AEST)
Received: by mail-qt1-x849.google.com with SMTP id c13so2725189qtp.21
 for <linux-aspeed@lists.ozlabs.org>; Thu, 05 Sep 2019 07:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=RaOdMEdHWabRyA48tWifREdKC/PQMtkOlsK8xXnOLlg=;
 b=BtnXfkFFib9LY2N7CLMrbVvS73v4Eq6wm+VbGidSpNhFCD42EtMTDvVL8+G02UX2lJ
 6hfjWa8pXNEsKJfxRxDoiJ6Js2le/D2knnMzOom9h3YZXu6WCmWpYxSPqhxIf8XvjDqK
 4mY6MhLeCLz8/uWepBTNX4NevsjTbdtjpmk3VvfemuGiEPKEMVJGs1z5NKuM2TNKIIoy
 rU9+aiGOOrDooEWyk2m/Kjd8XrbaMEzSWl/SESdIm9GPtZki1ifsqtx7xqM3Ww2w7UL0
 9GgqgjK2Efr4Fibow4GjVnEev3fd78/76t9xWzithNMZm/vJerJGWBfYf/js6NCc21jt
 WkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=RaOdMEdHWabRyA48tWifREdKC/PQMtkOlsK8xXnOLlg=;
 b=hDBtGhkAPumgR9+yHoVr17Lm6NsC1ZYDVyasX+KIw+tTPv9A5pQC/YbyOa7NHRHKNV
 J66s7EvUMjS25xN4bRvLeN8YdrqHHDPHhGmlZlpAVR9g/UwuWvfC7HorIsCyJ95A+qBG
 osK7aeaqapMCFlPZs9OE4o60lkOI3RJ89l7225KR7Tli2A2KX4RmkUxFQjeYYddu+lfs
 i06e5hlkXz+juKL4rXt/dLG3uyhlVvqINfla8qOBr13bb/S2LZRC/j3mTTElqDy8ysMn
 cWEjrBL1oY5SjHL6nZ2/N78T3oqnb4uxpQGY0r6ZY2UGaItIS/j7Fyr6/UUTVfs3hazp
 TYVg==
X-Gm-Message-State: APjAAAX5oI8sqVxY6/0sPh8u8jzNpSgp+DS1GHCysCzkIW84cErrzzw3
 ModBI0diQ174b9Yky8JKJ6WjCFY=
X-Google-Smtp-Source: APXvYqzkDOBp79PXpEAipYZadtwGS7ZnIH63SZDea9FHuBgDn4feswfOL5kDKxXMwh4xwbR5YKHd0wE=
X-Received: by 2002:a37:9d3:: with SMTP id 202mr3162654qkj.391.1567694501708; 
 Thu, 05 Sep 2019 07:41:41 -0700 (PDT)
Date: Thu,  5 Sep 2019 10:41:29 -0400
In-Reply-To: <20190905144130.220713-1-osk@google.com>
Message-Id: <20190905144130.220713-2-osk@google.com>
Mime-Version: 1.0
References: <20190905144130.220713-1-osk@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v3 2/3] dt-bindings: serial: 8250: Add aspeed,
 sirq-polarity-sense.
From: Oskar Senft <osk@google.com>
To: joel@jms.id.au, andrew@aj.id.au, robh+dt@kernel.org, 
 gregkh@linuxfoundation.org, jk@ozlabs.org
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Oskar Senft <osk@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add documentation for 8250_aspeed_vuart's aspeed,sirq-polarity-sense
property that enables to auto-configure the VUART's SIRQ polarity.

Signed-off-by: Oskar Senft <osk@google.com>
---
 Documentation/devicetree/bindings/serial/8250.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.txt b/Documentation/devicetree/bindings/serial/8250.txt
index 20d351f268ef..55700f20f6ee 100644
--- a/Documentation/devicetree/bindings/serial/8250.txt
+++ b/Documentation/devicetree/bindings/serial/8250.txt
@@ -56,6 +56,11 @@ Optional properties:
 - {rts,cts,dtr,dsr,rng,dcd}-gpios: specify a GPIO for RTS/CTS/DTR/DSR/RI/DCD
   line respectively. It will use specified GPIO instead of the peripheral
   function pin for the UART feature. If unsure, don't specify this property.
+- aspeed,sirq-polarity-sense: Only applicable to aspeed,ast2500-vuart.
+  phandle to aspeed,ast2500-scu compatible syscon alongside register offset
+  and bit number to identify how the SIRQ polarity should be configured.
+  One possible data source is the LPC/eSPI mode bit.
+  Example: aspeed,sirq-polarity-sense = <&syscon 0x70 25>
 
 Note:
 * fsl,ns16550:
-- 
2.23.0.187.g17f5b7556c-goog

