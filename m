Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D7F9893B
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2019 04:07:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DSbv1DcLzDqSD
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2019 12:07:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="NhKDi/7+"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="xFe8Pd6v"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DSbp2CC9zDqQZ
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2019 12:07:50 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9D6392201F;
 Wed, 21 Aug 2019 22:07:47 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 21 Aug 2019 22:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=phwzCto+xI4vielIqzEDuSRU/H4Y41n
 FU+M+iy8te4M=; b=NhKDi/7+lBruOTWE3uiSMbnTvIRp7G/fmS5KSfdvlMddA94
 uQYFOTAX6Ty4QDpS8kJ/2OMhT+tUq35bbHO2yqDxQ762BawGjajWXBk9t1LOhWYK
 kX/d1sZuosExb9j58JVw7lXiX7RjDdMlxvMzv1CcUzxZc3eddMLm+y5YSYiwPs6q
 fySsr+RBJlrVBTOBHliPmUrNddpIodmwX0N+EWXlI2nrD4rkRxTmf3aAOBMtJKBF
 zCM9z4eo4wnN3NFGjkwu0Um0u3ZXWjxKLJrMlxmd01c2iH/gaeORQqYfVVw/moAM
 EHsOtFA687f7V1rwMi2/m92HKKiIHghy3lWI1+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=phwzCt
 o+xI4vielIqzEDuSRU/H4Y41nFU+M+iy8te4M=; b=xFe8Pd6vW8dyh4gdk2OY63
 Gne769etNqEYYpV2H7+31piSAnFRq50Q8zzPFks4z8+T9EOxlxJkyGWHP14fCJ/8
 M9cXm1K9p6Oj2l/TqH/dyq6y6IXU1wJ6JuoZ/CSjOQatMCPUz1d+Z3epkigJd9Mp
 hB9ygxyMQoze8mWm04uFCfUaZIYwuR6yBYhwFiQi5ktMGgtg8cyhhaXAIuE7O5mV
 nuhz0TlPMgz8Ig5m5OlB8IABD0AG2IZTf7SQqFpjWKN0DP+pz5WHfTJOdl7W7ukC
 zym2o8CH706CYzla1Jey4+XNhVkrcoSBlp1N+4VydPpNSUty5DDoSvNwJOqJhG5g
 ==
X-ME-Sender: <xms:8_hdXfcaWcz1ZgMSbkiuqDVGsynnY1P-EtY6YyCUTFxWkcaMShr9Ag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeggedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgepud
X-ME-Proxy: <xmx:8_hdXeVdgZA4qQZ9obE1j3gp4nXreIAqYqfdYpLmiZc3DP-bXrmSAg>
 <xmx:8_hdXWVAmyc3F6D4dwG8VSJshHWd7ETIdRgsmgmrogk5x_Px74MKwA>
 <xmx:8_hdXQZVr3r3L3KsQ_HgEMPGaaE0H-X25Z3yfuQ5-lo1R9ESxu-7sA>
 <xmx:8_hdXSf_4U4byCHwsAE3mEXpQOOQ31_0pqA3OnIv15FJ12g7UaIHsQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5A569E00A3; Wed, 21 Aug 2019 22:07:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-916-g49fca03-fmstable-20190821v7
Mime-Version: 1.0
Message-Id: <e9da04cc-65a5-4fa9-afb7-1b3ea2e0a210@www.fastmail.com>
In-Reply-To: <20190821055530.8720-2-joel@jms.id.au>
References: <20190821055530.8720-1-joel@jms.id.au>
 <20190821055530.8720-2-joel@jms.id.au>
Date: Thu, 22 Aug 2019 11:38:03 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Rob Herring" <robh+dt@kernel.org>,
 "Arnd Bergmann" <arnd@arndb.de>, "Olof Johansson" <olof@lixom.net>
Subject: Re: [PATCH 1/7] dt-bindings: arm: cpus: Add ASPEED SMP
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 21 Aug 2019, at 15:25, Joel Stanley wrote:
> The AST2600 SoC contains two CPUs and requires the operating system to
> bring the second one out of firmware.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
