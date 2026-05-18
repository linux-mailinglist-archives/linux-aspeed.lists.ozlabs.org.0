Return-Path: <linux-aspeed+bounces-4081-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDqCJ0SmC2ozKgUAu9opvQ
	(envelope-from <linux-aspeed+bounces-4081-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 May 2026 01:52:36 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F8E575381
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 May 2026 01:52:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gKF2P3YTCz2yS4;
	Tue, 19 May 2026 09:51:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779089653;
	cv=none; b=h5XgssYO4pSXVAy+uXrwqt3bvy40ftPQRpi/ATDK0Ais2j1G4JtwsnTWLn35kHh3M097pMLmkJDCQ+a75IBCKSPidUgx9ephz6GitmRiSwP5KSgWd8nwZdCNiJll3bhNfTanQtKgx0eeo97SpwOzpAuGPAmDATpcNwGzAGwj15ozozzpjn02EGorYHYq6esar7qro0dFRXYN4Vi8/OztsQs/qG3LAG6DiIK24LB0o3nZdk3cPO/Rs+S/sxVGQ0f9Lt92FMOBSmhrpdL5vleEWGmiI2qdYfINSW0T+jBNUVDAkCg05zxRjIjAanxqwAhu9jRH9KKKUZcALSQ2fT90Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779089653; c=relaxed/relaxed;
	bh=feqASc44QbNe6VCpQPPDc88UHJTnZ4FT1o849ySLP3c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cs1eQROSF+fs57Ir1zO2eaVmhLmg+8VgyUqqfNv89Mb83MstMgsNcKRcSFyRyEEJwjPJCWjPnWW5mzs4zcrbmWoC9+OUSx0GJaxcWTneJTSC7Je+3R4QHCfJh6ZPCFLWBkaGdmS99uUIWKsXx/rXhLd4eeDgt7Q59hknWmnD0rL8EutClGsaXVAiT9mTAMVbWrArMZJsXkjAtbRAxnXH24KZTaRoAnsywT+OmktSURJIzlvMNT4NPMzqA8Zm2d9lznyX6XXjL6L6NZc24PhNVkaBpRgGa/Gm+g60OaRqk96AhjkQeRfg+C5LRDshxEq3KEhm+CA+vT7KDN+AnqAB9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fWCMQ5o/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=maoyixie.tju@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fWCMQ5o/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=maoyixie.tju@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gJqLX3D9Yz3c4V
	for <linux-aspeed@lists.ozlabs.org>; Mon, 18 May 2026 17:34:12 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c8025f1c227so1629136a12.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 18 May 2026 00:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779089649; x=1779694449; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=feqASc44QbNe6VCpQPPDc88UHJTnZ4FT1o849ySLP3c=;
        b=fWCMQ5o/PPyKxfL4NFgjX8NHHStXA5b55gcUE3jwzHgiN0Ov7w/XvbzotRdUssGazw
         mkcJygicjOa/OAlme5Ty+pFECGRoRnE5bA3oMGwpmRchwaX7jNPfNwFzQmj4+oGiV7ZY
         VWQUWvq7p0j2Cb0429Z0D5ZoC7WugvEDxNVFGDzVVQCbbWm8IG0GjnxsdhLZSssVF4Ct
         JsmD+URT4VkGb7/FUGQIaGpwSkzoOyQXe4281aszo7mSFwY74Vzg6w8RXQjZFD34PNxO
         69t1jYtO1fDIdLsGgXZnFqsI+PEorSgIpEXPHmn55iS5Q6ogiwYQ7UIgC4NtoZCo2llE
         XU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779089649; x=1779694449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feqASc44QbNe6VCpQPPDc88UHJTnZ4FT1o849ySLP3c=;
        b=OZ8s0je8W5OgamMxxIsZR0ife4KJL+jDGuwxxkIjoCA0MD1+mN1zYIR9d1yyEXne7w
         QKL44k2UfXYyf99F1qK468h7CbZ9WKmv4ne//QMqfMD2LkhIjqTlnJqdx8kYt7PrDMBo
         WQFeNdqjXSlfoWJrfJpAcRnwnlMda3mTQHhGgqt1Mza18nlnbmEAyV6n/J+BopY52JNZ
         DiMylmX6Fq2AYWU4QXwCaz+Nvl93YA3qWC6zj5RQY4QzXiP6geP5bnHpWB7yoWVTienS
         pjIBJrWW5TXYbAH6alIv4JW0CIgfPnNymz/uwOwyR9Hi8r3QcV+H06lHsQkEwaXVX374
         A4wg==
X-Forwarded-Encrypted: i=1; AFNElJ/FvmOTPsrzI1YM8NHHN9bH5LfjuAlk/17xSQhF/kqHn80HxuLY6Xlk5g2CxDqIX9fWnHWKnpssnuqrHMg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw7SIUOJnLUxJTet5YeiskNiivPrcZWxKhDkc1dIeMdArFEfMNE
	EZdEJZ4AJEW4D9CprskcmFsHzknrDkK8J8MIwQMuWnmsTcBdNrhKci2O
X-Gm-Gg: Acq92OFi2W0Ix8JXq+o2ifNykZlRYIIF+LL/vH7ngCDq5EPe8AIEZHytYDrpeQbQrIx
	o6WVM6/+xSquuyZTbcxAI7HKAOSluMWQueDbMvZqcxXZJUPvL2Iyxgp3QQXJcAjJhVy736hUdVF
	Z1+/53SFanwvFKH1Y3dX5oabR8UX/gbLkdHtICwE5/fwGexNP8YF8BeN4AaIFe/wzQNnWs614YY
	I6l56cDrEJMRIs0heUsoTqnFFGxpKDwvkMmlMWSguy25yFqmcpqqEG0+pmQT2GNRd+YfAR2UG2G
	kmEFb52/tZRJNhP6evGUt5oFkMtdu3QYl98ZMAVYObbeXYN6jXdgKJaCS8XtC6jBFCTZPXZGeDT
	VgqcWbtEqTu8yb0Tbz36TYwBCo41E4vbmdb+GzSd5T8IXda71N8QlDRV12BVBi0JFhP80d8giPy
	J3qWVtE1rC+j125LJOMhUB1SbwvSK+I/zKIUHKY75yMAW0Hg==
X-Received: by 2002:a05:6a00:3e22:b0:839:dd77:3501 with SMTP id d2e1a72fcca58-83f33c33546mr13925885b3a.1.1779089649248;
        Mon, 18 May 2026 00:34:09 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19775ca3sm14500746b3a.14.2026.05.18.00.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:34:08 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
X-Google-Original-From: Maoyi Xie <maoyi.xie@ntu.edu.sg>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Neal Liu <neal_liu@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: aspeed_udc: avoid past-the-end iterator in dequeue
Date: Mon, 18 May 2026 15:34:03 +0800
Message-Id: <20260518073403.1285339-1-maoyi.xie@ntu.edu.sg>
X-Mailer: git-send-email 2.34.1
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:neal_liu@aspeedtech.com,m:gregkh@linuxfoundation.org,m:benh@kernel.crashing.org,m:joel@jms.id.au,m:andrew@aj.id.au,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4081-lists,linux-aspeed=lfdr.de];
	FORGED_SENDER(0.00)[maoyixietju@gmail.com,linux-aspeed@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[maoyixietju@gmail.com,linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,ntu.edu.sg:mid]
X-Rspamd-Queue-Id: 06F8E575381
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Maoyi Xie <maoyixie.tju@gmail.com>

ast_udc_ep_dequeue() declares the loop cursor `req` outside the
list_for_each_entry(). After the loop it tests `&req->req != _req`
to decide whether the request was found. If the queue holds no
match, `req` is past-the-end. It then aliases
container_of(&ep->queue, struct ast_udc_request, queue) via offset
cancellation. Whether that synthetic address equals `_req` depends
on heap layout. The function can return 0 without dequeueing
anything.

Use the cursor-vs-result idiom from the sibling aspeed-vhub driver,
ast_vhub_epn_dequeue() in drivers/usb/gadget/udc/aspeed-vhub/epn.c.
A separate `iter` walks the list. `req` is set only when a request
matches. After the loop, `req` is NULL if nothing matched.

The same idiom is used by the other UDC drivers in
drivers/usb/gadget/udc/ (at91_udc, atmel_usba_udc, dummy_hcd,
fsl_qe_udc, fsl_udc_core, goku_udc, gr_udc, lpc32xx_udc,
max3420_udc, net2280, omap_udc, pxa25x_udc, pxa27x_udc, udc-xilinx,
bcm63xx_udc).

Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 drivers/usb/gadget/udc/aspeed_udc.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -692,26 +692,30 @@
 {
 	struct ast_udc_ep *ep = to_ast_ep(_ep);
 	struct ast_udc_dev *udc = ep->udc;
-	struct ast_udc_request *req;
+	struct ast_udc_request *req = NULL, *iter;
 	unsigned long flags;
 	int rc = 0;
 
 	spin_lock_irqsave(&udc->lock, flags);
 
 	/* make sure it's actually queued on this endpoint */
-	list_for_each_entry(req, &ep->queue, queue) {
-		if (&req->req == _req) {
-			list_del_init(&req->queue);
-			ast_udc_done(ep, req, -ESHUTDOWN);
-			_req->status = -ECONNRESET;
-			break;
-		}
+	list_for_each_entry(iter, &ep->queue, queue) {
+		if (&iter->req != _req)
+			continue;
+		req = iter;
+		break;
 	}
 
-	/* dequeue request not found */
-	if (&req->req != _req)
+	if (!req) {
 		rc = -EINVAL;
+		goto out;
+	}
+
+	list_del_init(&req->queue);
+	ast_udc_done(ep, req, -ESHUTDOWN);
+	_req->status = -ECONNRESET;
 
+out:
 	spin_unlock_irqrestore(&udc->lock, flags);
 
 	return rc;
-- 
2.34.1

