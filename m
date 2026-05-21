Return-Path: <linux-aspeed+bounces-4114-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Cs4O7SWD2o1NgYAu9opvQ
	(envelope-from <linux-aspeed+bounces-4114-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 May 2026 01:35:16 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CBF5ACCFF
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 May 2026 01:35:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gM4X14tppz2xwH;
	Fri, 22 May 2026 09:35:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779346478;
	cv=none; b=kbSogRNLF1RR1VfCibd+Qd8Le2QYM1O00FMjLxMfVPk8aYgQAFBO8BcULFCmmdaSq4zHe125Rrpeiq5HvVaBVMKsWZKUJ8/FqXh+40+ZsFl27mBo7+qgMyAJrxsT4MHaq2ycmji2QtsBihpRiyIK9UqUWncKx0bOEavAyfx5eMOMYrtzt460lFKgZPfuKgrNQPIOu5RaRPOj+uZg06pdPlr12NBxhM4Q6/TDRpHdseNEmVdsTDpZdqLkTGgTC4fAw0mc4PMIl7dBec0wKNVcLDTt2+2X5UK6hLjdy9XGMhA4AKV4Jj234n52ZzeTrotVCDcBY1Bd8GRz5MzH3JiviA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779346478; c=relaxed/relaxed;
	bh=AaciwSm1L46TIODxCA9aHpcFSHmqvrXKCz/1wzRVFx0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gRTtSvfSy4S/rt1q6vefqcgte3L4zR4Kz+WuH209i2WmVcJtab0RpZE+vL6+LW+y1EAehru3ZYTiLp51MlzSs7f1xugY+6vwT7jRw+EPAl99HOVFxf0ZB22AvpSTCJSxPSTOQtRIrpbw2ZcXqYQDm8y8nfY8gr20F7oW3gK7Jlzx+iQNWVwbXnSnCY5tqnhhaMVpAxusT4SV/KuBty6IEvpHmTRl11OacMrNB9pn3BPNI0Nv2d9Ieoj/nsdTu3qWXoMXs6dVd2zaYA4RiiEh85dQaLWEifrolveFKBwjsgNAzP0OOUr1kPgvYbYhaysU1kbktBMYxM/FANsyqoe79w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FKaQyTYg; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=maoyixie.tju@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FKaQyTYg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=maoyixie.tju@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gLfKS5cqJz2xGY
	for <linux-aspeed@lists.ozlabs.org>; Thu, 21 May 2026 16:54:36 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2bd9c3b550aso39179665ad.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 20 May 2026 23:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779346474; x=1779951274; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaciwSm1L46TIODxCA9aHpcFSHmqvrXKCz/1wzRVFx0=;
        b=FKaQyTYgbdTf3X4TR2nhJmwVEUK9ru9VIjz9NGrzmlCa8fx7/QqRg59pPjBdMyFtMP
         7T/w7/epS/6KQlTYtzyBubYRuq8hmF05UqCyMe8Pc5a2a15KFsbJVr13RuVtkt4hpCfW
         XzQi7rETiIst9/UaGN8T9yp/4bBjRCNXqqyFjN+U0Uog1FZ2lZiy0WKqDvVm5mYxS+Js
         kyOSTx3ZeEYdMMkTQQ0Wkc8c06y1Mw9/jIFiacLef6xNkCygNTliHE5FHIVnU4rT2UC3
         Q/0cbOtQGv9DBlVkSXb2m2lXb3sKN9A8x2K6I/9yep+F2NBPC+kj+mZaAkc4zzgQgsPS
         flEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779346474; x=1779951274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AaciwSm1L46TIODxCA9aHpcFSHmqvrXKCz/1wzRVFx0=;
        b=E0N/bt5QR9jYBk3l3ObKzTvPzCmo+OO2OaOZZ862oUbMVtycaXpueOnregFpjuHdyb
         MPgYMmR8Y8Ovt2phPgmL6exAhPrW0abqaR+Uiqap6Vc/e3s50LBYSWSdJCB0zUzmZxX/
         odf0h9dJJlRpQ7DF+jP82LXG8aLnixNbDSzW+ryNXPcomqpJrR4KcBZPLWUBQ5phMu5y
         7HTTjjRTpGMaO8VlZEVSfxwsvnAJHwuTIM6A55rSrGWCSmCpXezTDqZ7oPiY0dFb1xKT
         0r4JtzJBKQUB5NCgBuLbULQ+P1JKeqyMVS3Swq6uN21k2m1YN9WS/xJnWXpPhsMkhj1h
         QCqg==
X-Forwarded-Encrypted: i=1; AFNElJ8UOFwYHcTkxYpXmbn479cFqiWmjVriPN11yq3nkVET/NsH6O3wxJZQ7O/05uioc2V6j/dV0e6HBq8IHqE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwEErRjbEMfU/EL2PhirU1VVycjn2wiBQZFBLmuIDj0Qd7+1f/y
	5iu/ID49snIE1qOiX6ep2OtlGnkUOiePivcVmUF/tHubc+oaNyXMiMLb
X-Gm-Gg: Acq92OG3etAAAPRCDGuyl9pQReuweQGkfrqlWOd4Nc9x7kZMEEt8HpeVf6AZxnUQkaZ
	V3QB8OsvlEm3YFAM/6eK6UKqMfDGLSAw0qNK8YtvRU0ZR/nWWukNf028kgBFMr2TVzNz4Mg5ZIt
	Da/Z8O/qhtz/x8R+L7znVyD8s1X0hBfSfoENZ1f8qc32rMBEah7plBx/YVzLRrMMdMCWHUJUYL6
	pJ8hAKL9yRChMpaecXGHfoNtTyukf+4V2T6nbB4AuREHOByuTWq1XcwgZW2nbK9JqIPnnObCu7z
	stLCn5GPZ2NKUI9b+UVfm+rcg8XghMiCQYQ3ypZRTK98ODo1KzI55tcRit3xcjB1xRpYFx74qU8
	FD1941ya3nTICJM8eT2so3d+G7K/FrtMrJMde38nNpU7V4yl3kmvnZVOVTfp1sNC4fenxwkrl1A
	fTA+hnjpXSwloUlANKO4zS6Mz6yTx17WOXLVzru8HCNdM6II+9
X-Received: by 2002:a17:902:e750:b0:2bc:8ebd:af76 with SMTP id d9443c01a7336-2bea2fb709dmr15581365ad.0.1779346473759;
        Wed, 20 May 2026 23:54:33 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd384sm241757715ad.65.2026.05.20.23.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 23:54:33 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Neal Liu <neal_liu@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Lunn <andrew@lunn.ch>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] usb: gadget: aspeed_udc: avoid past-the-end iterator in dequeue
Date: Thu, 21 May 2026 14:54:28 +0800
Message-Id: <20260521065428.3261238-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519080213.1932516-1-maoyixie.tju@gmail.com>
References: <20260519080213.1932516-1-maoyixie.tju@gmail.com>
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:neal_liu@aspeedtech.com,m:gregkh@linuxfoundation.org,m:benh@kernel.crashing.org,m:joel@jms.id.au,m:andrew@lunn.ch,m:stern@rowland.harvard.edu,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4114-lists,linux-aspeed=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[maoyixietju@gmail.com,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maoyixietju@gmail.com,linux-aspeed@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,harvard.edu:email]
X-Rspamd-Queue-Id: 09CBF5ACCFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ast_udc_ep_dequeue() declares the loop cursor `req` outside the
list_for_each_entry(). After the loop it tests `&req->req != _req`
to decide whether the request was found. If the queue holds no
match, `req` is past-the-end. It then aliases
container_of(&ep->queue, struct ast_udc_request, queue) via offset
cancellation. Whether that synthetic address equals `_req` depends
on heap layout. The function can return 0 without dequeueing
anything.

Default `rc` to -EINVAL and set it to 0 only inside the match
branch. `req` is no longer read after the loop, so the past-the-end
dereference goes away. No extra cursor variable or post-loop test
is needed.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Suggested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
v3: Switch to Andrew Jeffery's shape: default rc to -EINVAL, set
    rc=0 inside the match branch, drop the post-loop check. Smaller
    diff, no extra cursor variable, no goto. Same semantic fix as v2.
v2: https://lore.kernel.org/linux-usb/20260519080213.1932516-1-maoyixie.tju@gmail.com/
v1: https://lore.kernel.org/linux-usb/20260518073403.1285339-1-maoyi.xie@ntu.edu.sg/

 drivers/usb/gadget/udc/aspeed_udc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index 7fc6696b7694..75f9c831b21a 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -694,7 +694,7 @@ static int ast_udc_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 	struct ast_udc_dev *udc = ep->udc;
 	struct ast_udc_request *req;
 	unsigned long flags;
-	int rc = 0;
+	int rc = -EINVAL;
 
 	spin_lock_irqsave(&udc->lock, flags);
 
@@ -704,14 +704,11 @@ static int ast_udc_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 			list_del_init(&req->queue);
 			ast_udc_done(ep, req, -ESHUTDOWN);
 			_req->status = -ECONNRESET;
+			rc = 0;
 			break;
 		}
 	}
 
-	/* dequeue request not found */
-	if (&req->req != _req)
-		rc = -EINVAL;
-
 	spin_unlock_irqrestore(&udc->lock, flags);
 
 	return rc;
-- 
2.34.1


