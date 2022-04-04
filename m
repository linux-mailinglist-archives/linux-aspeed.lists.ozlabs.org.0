Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6EB4F173C
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Apr 2022 16:39:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KXD1J1Lrdz2yPR
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Apr 2022 00:39:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XbFFVR/b;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=linmq006@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XbFFVR/b; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KXD1B03mSz2x9V
 for <linux-aspeed@lists.ozlabs.org>; Tue,  5 Apr 2022 00:38:51 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 ku13-20020a17090b218d00b001ca8fcd3adeso3306104pjb.2
 for <linux-aspeed@lists.ozlabs.org>; Mon, 04 Apr 2022 07:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=/OOC2V7xZiaknaBKj4i3q7VnOh6KcuMP7wXUOuaSHIk=;
 b=XbFFVR/b5q9T/ccQwMNV7oS8jmz/8ydhO2wbuZ4dnTMtjIzB6jdnZMtjVA+gVPOlNi
 Fh3L/YtSRG0H+pWEhoLWfqjheiDJivSt2rc02u/dwUeHsKoBGABxJRp9Jbb48MYAIpim
 O64PfE/ok5JMyRZ3CQZiEICQ5VUUxCnwUPfrsPhqA1dALFfBxFleTbQd5I0odX5BNO59
 lKbzkBuY3TkjHZXaiTT997YZJcB8tyMTKt+oGo6mJ+/QS2cIoRy8bam9Qw/r6vdNGJhI
 sSITUz76YsxGcaKHQZJ+gQ3pAf+eeVfQMh7bey9qc6JpwoJpJoEYlSE3bBgYBWIehayO
 Q7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=/OOC2V7xZiaknaBKj4i3q7VnOh6KcuMP7wXUOuaSHIk=;
 b=3CmCnVrYCFO73poPx2GeKtG6Zkp3o1RPQlTYtBeato19g3SC55Ghj+rFCOlzmZ8oaA
 /9sSGNeOcgSvfWPHq8FkxyyiazBSmQg/E/Znx1+XWnwwDygwf05bfIccrfqxy29cjzbS
 m23hOXq5Q/2GDM/geVDQMqv3BVli+IALojW/L5nRumXzlpMhgs71NnbILPDLBe70wXZw
 RSPl9HBIZAeLgCrNQZ/3Ip4dmMys1+B76auXB+U3Ujj0ar1KbIHL6Wtw5KUAiNsIZFMY
 RUzZdm5c0CA2t1XID059OfGP6CiRmVWm8DBwrAZ043q81f/hcp5w1RaUMSkUe8snW0UU
 5odQ==
X-Gm-Message-State: AOAM530AkWUseSgXNRd4omXc0fMxVXe7xkq7QTgXsAouwgEfOAp77pyt
 iaGgxVey6vsH/WFDTjtS+z4=
X-Google-Smtp-Source: ABdhPJyhtOBPPj1peqOQfSYtTssZudXWivrHTu/PMrPp1u6em61raME54CbKsHs/3PFKQmSppHnJWA==
X-Received: by 2002:a17:90b:4d85:b0:1c7:3933:d810 with SMTP id
 oj5-20020a17090b4d8500b001c73933d810mr27001609pjb.129.1649083128678; 
 Mon, 04 Apr 2022 07:38:48 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 a11-20020a056a000c8b00b004fade889fb3sm13135860pfv.18.2022.04.04.07.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 07:38:48 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Zev Weiss <zev@bewilderbeest.net>,
 Johan Hovold <johan@kernel.org>, Yang Guang <yang.guang5@zte.com.cn>,
 Miaoqian Lin <linmq006@gmail.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] serial: 8250_aspeed_vuart: Fix potential NULL dereference in
 aspeed_vuart_probe
Date: Mon,  4 Apr 2022 14:38:40 +0000
Message-Id: <20220404143842.16960-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

platform_get_resource() may fail and return NULL, so we should
better check it's return value to avoid a NULL pointer dereference.

Fixes: 54da3e381c2b ("serial: 8250_aspeed_vuart: use UPF_IOREMAP to set up register mapping")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 93fe10c680fb..9d2a7856784f 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -429,6 +429,8 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 	timer_setup(&vuart->unthrottle_timer, aspeed_vuart_unthrottle_exp, 0);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
 
 	memset(&port, 0, sizeof(port));
 	port.port.private_data = vuart;
-- 
2.17.1

