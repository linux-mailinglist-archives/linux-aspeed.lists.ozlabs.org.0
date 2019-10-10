Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1C8D1E2D
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Oct 2019 04:07:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pZGQ61jWzDqZW
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Oct 2019 13:07:10 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="NwmmRozZ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="syn9HLHh"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pZGD5lZrzDqZG
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Oct 2019 13:07:00 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 53F3D20963;
 Wed,  9 Oct 2019 22:06:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 09 Oct 2019 22:06:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=0W/usZNXhyMNI
 sw8q7SzfZokc2ewQzqfo920euFsCVM=; b=NwmmRozZlTgjttXStjhFwzJWXVL3w
 /yYViPG7a3iKaq9FfF5mxMlb54iHBgjUio5gPYOUy5uOVzuy50BeTJ1I8x4fTja8
 GRaBpaDz3SRELmBtLfmZnzxRXHhK+gKwwgFhEaU2nOIbXQYHo7Atd0x5LQXg4Y3X
 bVs+AQvSJhteiTpHjvWworuxA+k7uGTWWyH7oDhNWPSCkGreOycXCl81k0j38444
 eUBwQO+CFZvD9gQfRLrUu7iRywH80YVAbKzI9i683YsoLM1uYshI1Aa39a4boQnL
 B2wVQv65AIjS7OCS2ud/QAXNmhxHT6aq7WBYXk7vWescUU+8hmCu1ZqUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=0W/usZNXhyMNIsw8q7SzfZokc2ewQzqfo920euFsCVM=; b=syn9HLHh
 nQhZND7rdrUgRaKPfCfJZjLhA9wmm+7rQcd0b9nSZVKZcpgyIWZDCucgE8SVAH36
 w3jyRW01JN0To/1gqQfNc4FHF7hx/jT/b0SlrrU+YvFnc0ofM+55j2T21kAdFnRY
 cbGzttoxdRfnsSSbp+Qe2R0cW+SbRwMYozQxR9AvVFZaJj1gnnlu1LGwKWs3Zaw+
 0FFMtYbADKv0CORqnkVaIlRC75zs7yA0J1dKKVJJ1smWbPc4CHfZnwiD1UTj6VpM
 7LBrNOiAoVkMeKeAo6u/DcJctFCRkGXBcHjI8i2pHKyfDtE2xtF357BZcvqnd0zC
 gjio90VO77Jw+Q==
X-ME-Sender: <xms:QpKeXUq8ROxqBkOMtvkEUi_3e9hH5sFCXYkOlwZBf1lIaH2rJ6wO3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedriedvgdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 ge
X-ME-Proxy: <xmx:QpKeXRHjJ2DmUpEbaY8TEK1LNOpyvzrePzz81mRCM6nqMnds7Hw4og>
 <xmx:QpKeXSAHQ8N0wPR65BF6Za8XwTBIGdSQr3NyQjVG-myAreUru4HwgQ>
 <xmx:QpKeXeyt3LGeQuA2zQM05oJKv0iX1tzpEsU8SPEON7fR0itzWsVRNg>
 <xmx:QpKeXTl-UyZhm2le3voM-zgsOUS9UOAVdw_HBLtUy9aybRJAaNgP9A>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3272D80059;
 Wed,  9 Oct 2019 22:06:54 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: netdev@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: net: ftgmac100: Document AST2600
 compatible
Date: Thu, 10 Oct 2019 12:37:54 +1030
Message-Id: <20191010020756.4198-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191010020756.4198-1-andrew@aj.id.au>
References: <20191010020756.4198-1-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, davem@davemloft.net
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The AST2600 contains an FTGMAC100-compatible MAC, although the MDIO
controller previously embedded in the MAC has been moved out to a
dedicated MDIO block.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/net/ftgmac100.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/ftgmac100.txt b/Documentation/devicetree/bindings/net/ftgmac100.txt
index 72e7aaf7242e..04cc0191b7dd 100644
--- a/Documentation/devicetree/bindings/net/ftgmac100.txt
+++ b/Documentation/devicetree/bindings/net/ftgmac100.txt
@@ -9,6 +9,7 @@ Required properties:
 
      - "aspeed,ast2400-mac"
      - "aspeed,ast2500-mac"
+     - "aspeed,ast2600-mac"
 
 - reg: Address and length of the register set for the device
 - interrupts: Should contain ethernet controller interrupt
-- 
2.20.1

