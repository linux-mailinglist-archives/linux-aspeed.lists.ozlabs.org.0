Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F2C91A6D
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Aug 2019 02:16:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BZGb3zdRzDr9Q
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Aug 2019 10:16:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="psSHkY+5"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="isN5gHRC"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BZGT6kxkzDr7b
 for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Aug 2019 10:16:17 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3A75F2067B;
 Sun, 18 Aug 2019 20:16:15 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 18 Aug 2019 20:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=o2Y1ru/g1rfm03mCKVr9rWJkvfhNUkl
 tmb3ZwidhSuY=; b=psSHkY+5FWcPlcoDP+crqOmhYIIE8nGc8bCYtjYjios5y/w
 6kpcrAwDzIt3ZfWCNdOHKL7MC1S0y9ebXNiNn+pWBlsVwaR6DkEORgcJkEmTED1n
 Pt68Z9fH3J8+bd709iDFoVB58eotO0+NJn7qhsmydELYOPb9DovxPH1dqOn8j/WN
 8lsTOJ33B2XEemBSngwvI/w38kRcwliUfzMGTAgrtre2iO54b/pWUFpQOLRAg2As
 GrVVeRxhdbRdZ4SRbBPF8sU8V7EHwiLjtCX0XT8AtsJcSxdTrRLIMqRb9Ep/9Rk4
 JfYOuQqYwyL1lj9PeF/NQh0okM/0+VgTx0hLRsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=o2Y1ru
 /g1rfm03mCKVr9rWJkvfhNUkltmb3ZwidhSuY=; b=isN5gHRCsKr9HVk+MlmwTl
 V73aHgQn1EnDRgQGL13nbYwwYw3GdCWpOZVeyhbRQ2lgdPBVCAbl6HAmxH8dPSW6
 WNc0WASRKpdwk0YfOQf103A51O6dO4iQ/HEq5pxDd94abbnxB/JZUXqW+eB6NrK0
 ICtF1uEPykbon6S11LPYCaFtD7ufEVUShCETGorqgFgYeMSMIaiVyVHXenRqjywQ
 5azfaBUwdp5c6Sv43DiVIciB+Ikw5LrC8XkwNqi5D44Hta2jsPQR3z7l58MN/iDE
 VZNS8Xq61KliTn6t+leJgz4SUNDWCjPR6r+moPdx/hlZPxAXL5frChHkyL2mLh2A
 ==
X-ME-Sender: <xms:TepZXca803avgHkIwbyggRpX9e_hA74psYMUjL1hkBmM0AbA01GdoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudefkedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:TepZXeKUDBEIbqj2u9y6mEzGBqWgi0vyY-O9F4cDqRZ7_JrLerfgYQ>
 <xmx:TepZXYtQKv-sQ0iBQm9mD3JhHlEKJUEETtL7yoYSxOJnPk7FEbqxEQ>
 <xmx:TepZXSUCo_rcAzLiaxKVYGJXAzxVoqzOkIE2TC7t1CTQnZ8YuF7oyw>
 <xmx:T-pZXZkjnesKGK3SeR7_DYnqN2_-qcnmYDZcyy7JhDdMLCA8H1F01w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6330BE00A3; Sun, 18 Aug 2019 20:16:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-869-g2d94aad-fmstable-20190814v1
Mime-Version: 1.0
Message-Id: <efbc1e57-5c5e-4ff4-af94-d18b017d64ab@www.fastmail.com>
In-Reply-To: <20190816160347.23393-2-joel@jms.id.au>
References: <20190816160347.23393-1-joel@jms.id.au>
 <20190816160347.23393-2-joel@jms.id.au>
Date: Mon, 19 Aug 2019 09:46:46 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>,
 "Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add ast2600 compatible
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Sat, 17 Aug 2019, at 01:34, Joel Stanley wrote:
> This adds a compatible for the ast2600, a new ASPEED SoC.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt 
> b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> index c5077a1f5cb3..d78d4a8fb868 100644
> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> @@ -4,6 +4,7 @@ Required properties:
>   - compatible: must be one of:
>  	- "aspeed,ast2400-wdt"
>  	- "aspeed,ast2500-wdt"
> +	- "aspeed,ast2600-wdt"
>  
>   - reg: physical base address of the controller and length of memory mapped
>     region
> -- 
> 2.23.0.rc1
> 
>
