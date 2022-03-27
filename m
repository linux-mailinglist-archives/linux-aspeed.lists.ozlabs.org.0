Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC9F4E8648
	for <lists+linux-aspeed@lfdr.de>; Sun, 27 Mar 2022 08:24:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KR5Qn058Qz3c1d
	for <lists+linux-aspeed@lfdr.de>; Sun, 27 Mar 2022 17:24:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NrLU0Tud;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=xiam0nd.tong@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NrLU0Tud; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KR5Qf5yhlz2yMx
 for <linux-aspeed@lists.ozlabs.org>; Sun, 27 Mar 2022 17:24:41 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id bx5so11185592pjb.3
 for <linux-aspeed@lists.ozlabs.org>; Sat, 26 Mar 2022 23:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=dr1pfWEjH/LtXsB7tWBt6bQIyc8GynNaruocx5UK+p4=;
 b=NrLU0Tud7dKyPrRn8FqNdKPZ7B+J9NM5tUooHHg3BkdUnZcMyXyEWggcERwvymf/D5
 NHttV+aFJg3cbs6CYTIPfr6oAxg1Uik0CQ5xkH6Pk8XYDOOtm0Sc+VPIDE8v5FIcDER4
 ujPKjNuz0Im4hQ5LXHN+57P1RWpXRdLtM3HNNeNaIr8RIulQStfCfLil2W2gN7rXDTfL
 qqFGTlabkl4FVmxP8AM/qfqWNnAshka/ZgPMYw974Yl1LonF47klbzkITdVK6S87SVZh
 pGxeGJHwamPBf0b9qkfcoMoMnpQTuRIIurLdpeOiEeyDEfQFSElvZxFP9ZNzo2CTM9mw
 yELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dr1pfWEjH/LtXsB7tWBt6bQIyc8GynNaruocx5UK+p4=;
 b=VAwIaU35oYzufuCCmNFxlMgb9yXN2nubRncSmnCsHRTILKbxS71WlFz19EnhXs5+EF
 JzDjoWQUI2ySMA7yUebS10nX6cmOoLHwzW7m8TaLWWW5GXDXDcolvD6q2dYY+H/hfbBF
 eWb15ijP5pPGy8QJMKVEM2vnLRi5soWt2oWNiXcVb09gNfoBZ4Hd1CxEBD432lff7Q0T
 6nLW+uq3toCFx+Mf74iXcRIlNf99kHnMKU/QP3+c2s9KbnbIem62LMgGmh8knxXFZgAk
 77ZCHpeSH9a7QpXNycY7kMqAdW/H0K3bZVwmoJHwdSJFgc2ItFhSdyE8W7M+eBw517Xw
 M+sQ==
X-Gm-Message-State: AOAM530vkfMKN5gRWgMQ7SKNwBvl1Ag+ATeC3HQdHWHo3wgIDCHveGYJ
 VQY+qFQPDd4UL9+83xawOa8=
X-Google-Smtp-Source: ABdhPJyGXjU/L3SAlfRX+kjprH5TGZQAun8MSIIIXSf68KUd+2NTcRZWbqiVuhcKNd4iHFEwB3EEyA==
X-Received: by 2002:a17:90a:ca96:b0:1c6:b478:788e with SMTP id
 y22-20020a17090aca9600b001c6b478788emr22401255pjt.162.1648362278797; 
 Sat, 26 Mar 2022 23:24:38 -0700 (PDT)
Received: from localhost.localdomain ([115.220.243.108])
 by smtp.googlemail.com with ESMTPSA id
 l5-20020a056a0016c500b004f768db4c94sm12228443pfc.212.2022.03.26.23.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 23:24:38 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: balbi@kernel.org
Subject: [PATCH] aspeed-vhub: epn: fix an incorrect member check on list
 iterator
Date: Sun, 27 Mar 2022 14:24:31 +0800
Message-Id: <20220327062431.5847-1-xiam0nd.tong@gmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, caihuoqing@baidu.com,
 Xiaomeng Tong <xiam0nd.tong@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The bug is here:
	if (&req->req == u_req) {

The list iterator 'req' will point to a bogus position containing
HEAD if the list is empty or no element is found. This case must
be checked before any use of the iterator, otherwise it may bypass
the 'if (&req->req == u_req) {' check in theory, if '*u_req' obj is
just allocated in the same addr with '&req->req'.

To fix this bug, just mova all thing inside the loop and return 0,
otherwise return error.

Cc: stable@vger.kernel.org
Fixes: 7ecca2a4080cb ("usb/gadget: Add driver for Aspeed SoC virtual hub")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 drivers/usb/gadget/udc/aspeed-vhub/epn.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/epn.c b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
index 917892ca8753..aae4ce3e1029 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/epn.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
@@ -468,27 +468,24 @@ static int ast_vhub_epn_dequeue(struct usb_ep* u_ep, struct usb_request *u_req)
 	struct ast_vhub *vhub = ep->vhub;
 	struct ast_vhub_req *req;
 	unsigned long flags;
-	int rc = -EINVAL;
 
 	spin_lock_irqsave(&vhub->lock, flags);
 
 	/* Make sure it's actually queued on this endpoint */
 	list_for_each_entry (req, &ep->queue, queue) {
-		if (&req->req == u_req)
-			break;
-	}
-
-	if (&req->req == u_req) {
-		EPVDBG(ep, "dequeue req @%p active=%d\n",
-		       req, req->active);
-		if (req->active)
-			ast_vhub_stop_active_req(ep, true);
-		ast_vhub_done(ep, req, -ECONNRESET);
-		rc = 0;
+		if (&req->req == u_req) {
+			EPVDBG(ep, "dequeue req @%p active=%d\n",
+				req, req->active);
+			if (req->active)
+				ast_vhub_stop_active_req(ep, true);
+			ast_vhub_done(ep, req, -ECONNRESET);
+			spin_unlock_irqrestore(&vhub->lock, flags);
+			return 0;
+		}
 	}
 
 	spin_unlock_irqrestore(&vhub->lock, flags);
-	return rc;
+	return -EINVAL;
 }
 
 void ast_vhub_update_epn_stall(struct ast_vhub_ep *ep)
-- 
2.17.1

