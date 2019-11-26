Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A084C1097CE
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Nov 2019 03:23:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MSPb3hvyzDqgX
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Nov 2019 13:23:31 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FUsNAgPN"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MSPC2v0qzDqdt
 for <linux-aspeed@lists.ozlabs.org>; Tue, 26 Nov 2019 13:23:11 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id q16so3219096plr.10
 for <linux-aspeed@lists.ozlabs.org>; Mon, 25 Nov 2019 18:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CD0CzYEX/o6Zd/uHP6vbWB6WMoC+4GyO2IXO0mq1OcE=;
 b=FUsNAgPNgMBrg+0iybequZCMxQOlKxjlz+oXNDgAn8Jku3YSeWHZP9QDGhlkW6G0v4
 2VLkOEdhyhaeeWmCmNMnO30N8TqUHA35JVMlmoIu1jlrflWbYz+yuGG0py3W3HnFW6rb
 x3rs8PUhKP67wje1fO22KB0s3VM6KCe0BZaeoi1i2x9+psysSjMnT7GRh03eKKE1Yace
 wIMK9jr7YU0Vv+nKdySEZ0z2k8O1Dmm41DS4Zlt4OthY/prcwe3t7JfwsPdYky1ueZiu
 LmfrI39msbRnsxGpHgs9+BDcE3VlL1dbPoQ88AJWhLVZhTckHlrboyjkSIdWPE/WePF1
 7wTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CD0CzYEX/o6Zd/uHP6vbWB6WMoC+4GyO2IXO0mq1OcE=;
 b=GpTluCVelRBJfETl0pKDjMNJe1NGpxrFkVQtOJgFx1beZdLvQsbVDEJHy1TV707NtV
 93nW1X2ZU8Gnuf8R8guRS+7OxUDpm+7yhiHGRzzxVN6fC9cQDscxulhqbk3fgiaBgP0B
 CgVl0Yk4n7GzSWVp4N7DYFs+q1GCXm6BpHAQ62hqaJmstbTe7ppp+8DYGgWfRiRJ7yhH
 19hM5CFmweXIk5/eKlV1pXuuko1rnhEqJt/TSzX9rTgGq6S8uft9qdN0hT8mVS9Ui0Pw
 Pr2kHHkX6RoruDAQGQSjmsX3/tSaXvCqe9QbR8LhgBAX+L+g5V4aHKaaDiK0YWo1kmcx
 2w9g==
X-Gm-Message-State: APjAAAVV1eNwJNhouZGi5L1hCogzY/JBAEF+97A+3zyRFa9DY3xnVD/M
 EXrvgrvk68dmZCKYVBp0lT8=
X-Google-Smtp-Source: APXvYqw6UNaft0xfeIv2zeZrxqCAJefQOKEyciNUpcWkgvrwqQ7cKd++GUsr7IxJw5bpatflGHbbcg==
X-Received: by 2002:a17:902:6909:: with SMTP id
 j9mr31706313plk.136.1574734988435; 
 Mon, 25 Nov 2019 18:23:08 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id q70sm666568pjq.26.2019.11.25.18.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 18:23:07 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 2/2] reset: simple: Add AST2600 compatibility string
Date: Tue, 26 Nov 2019 12:52:43 +1030
Message-Id: <20191126022243.215261-3-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191126022243.215261-1-joel@jms.id.au>
References: <20191126022243.215261-1-joel@jms.id.au>
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
Cc: devicetree@vger.kernel.org, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

The AST2600 SoC contains the same LPC register set as the AST2500.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/reset/reset-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 067e7e7b34f1..795c9063fe7b 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -125,6 +125,7 @@ static const struct of_device_id reset_simple_dt_ids[] = {
 		.data = &reset_simple_active_low },
 	{ .compatible = "aspeed,ast2400-lpc-reset" },
 	{ .compatible = "aspeed,ast2500-lpc-reset" },
+	{ .compatible = "aspeed,ast2600-lpc-reset" },
 	{ .compatible = "bitmain,bm1880-reset",
 		.data = &reset_simple_active_low },
 	{ .compatible = "snps,dw-high-reset" },
-- 
2.24.0

