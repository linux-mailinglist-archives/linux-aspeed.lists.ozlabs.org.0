Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DB32A1EE1
	for <lists+linux-aspeed@lfdr.de>; Sun,  1 Nov 2020 16:07:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPKC904JKzDqZk
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Nov 2020 02:07:01 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=trix@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=jFNxUBbL; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=DhiK1gJ1; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPKBt05T3zDqXL
 for <linux-aspeed@lists.ozlabs.org>; Mon,  2 Nov 2020 02:06:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604243200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=wJ/LAdUgWk4kj3ikySKt8S3LnfEtd4hd8yxK7w0mF2Q=;
 b=jFNxUBbLWoEJkEpf7LU7uNK/QE1i9nqr4/V02GJkTYqT25MBdUrSHdVOcAxkpGcCJrH0XU
 XKna8ml6GNWb1hV9frNHY7cNkwkaOgDBzmzkuUaRK6TkpqB2GnfAiUt/IYW2ft6F4Yquaf
 86tEwjE5u6GfbF/JR011320BbYgmyTs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604243201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=wJ/LAdUgWk4kj3ikySKt8S3LnfEtd4hd8yxK7w0mF2Q=;
 b=DhiK1gJ1q0d4gXLjq7fu3cO4j+TQxW6eIYFNKJWnU1GLx1yEw9nueHaUAOatNV/oM9x9e7
 XLiPp6oymTFPLHUsWY3NoSa9TDIosLLkEsH97h1WtINY7hpN42/VMvZZ94gWDcPBE0OLsY
 mMuOfVWCT3hu55sQBYmreujYvhV24/k=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-9T2psUgONzacXfMHMZhetw-1; Sun, 01 Nov 2020 10:06:38 -0500
X-MC-Unique: 9T2psUgONzacXfMHMZhetw-1
Received: by mail-oo1-f72.google.com with SMTP id j5so4587152ooq.4
 for <linux-aspeed@lists.ozlabs.org>; Sun, 01 Nov 2020 07:06:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wJ/LAdUgWk4kj3ikySKt8S3LnfEtd4hd8yxK7w0mF2Q=;
 b=Hi7Xl51kinhBSIMJMIrtSYlPHY/fxKzAKY8MVy3zpi+SXMTil0E8KPzHXMYsGugYwY
 l/214CQJjGk8OwDBranaCOyrQIpYYWewStfq1iJgldVtTK5WF80EcXPcOVX4J/TXKOpw
 VbIFHJBy4wficSirIRmHo7C/uMYAMn714AdiSYST1o3N+ICyio05zS7h0IRlxVJEp2LZ
 Ku+DWB1A7HoF9fq1UF9EZuGjtiIFWtB/cfZ/lRpahCUnONTLFU7xdFbXuW3V5tTtG1ko
 EeZeWVjQd3wd3FmSQBUgKBi5r/hH+OfN21o9n3crspUhA1drRw3DueFxgDMUA+mHYQ8N
 aRKA==
X-Gm-Message-State: AOAM5320fo5dx0wyoxhmjzbjTieRPunHXQk+kSFSt+lCtA8zyu19HQ7Q
 qAhHW/ECsOeNU5eS2r+OOoCpOa9UpAvuc8WrtSTMufTTaOugxDkW88BdsCuOO+ivluGc2f4S6dP
 JPgmUIDD+HfglSM/54GUUJOYgkQ==
X-Received: by 2002:a4a:dd0a:: with SMTP id m10mr8950425oou.80.1604243197886; 
 Sun, 01 Nov 2020 07:06:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxi7nrIgHcqXU72cuWS6O0nlS/xTzXubwdfw6WG3TMN7Pod2mwYawFVe8PQCYaME3qcvab8lA==
X-Received: by 2002:a4a:dd0a:: with SMTP id m10mr8950419oou.80.1604243197694; 
 Sun, 01 Nov 2020 07:06:37 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id w10sm1598353oou.47.2020.11.01.07.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 07:06:37 -0800 (PST)
From: trix@redhat.com
To: joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH] soc: aspeed: remove unneeded semicolon
Date: Sun,  1 Nov 2020 07:06:22 -0800
Message-Id: <20201101150622.2288203-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Tom Rix <trix@redhat.com>, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Tom Rix <trix@redhat.com>

A semicolon is not needed after a switch statement.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/soc/aspeed/aspeed-socinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/aspeed/aspeed-socinfo.c b/drivers/soc/aspeed/aspeed-socinfo.c
index 26db42ef6aae..20a1d4aeb051 100644
--- a/drivers/soc/aspeed/aspeed-socinfo.c
+++ b/drivers/soc/aspeed/aspeed-socinfo.c
@@ -51,7 +51,7 @@ static const char *siliconid_to_rev(u32 siliconid)
 		return "A1";
 	case 3:
 		return "A2";
-	};
+	}
 
 	return "??";
 }
-- 
2.18.1

