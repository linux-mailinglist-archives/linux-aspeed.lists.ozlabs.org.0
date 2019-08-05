Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D314680FB3
	for <lists+linux-aspeed@lfdr.de>; Mon,  5 Aug 2019 02:32:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 461zHd1twYzDqXM
	for <lists+linux-aspeed@lfdr.de>; Mon,  5 Aug 2019 10:32:29 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="OC/bJtu6"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="VR3W6WNB"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 461zHQ0GXnzDqSv
 for <linux-aspeed@lists.ozlabs.org>; Mon,  5 Aug 2019 10:32:16 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 911B6210AF;
 Sun,  4 Aug 2019 20:32:12 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 04 Aug 2019 20:32:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=Prb7tn3TJaxCnpwPPyi4xsZf7IapyER
 pEa2ECzebZJ8=; b=OC/bJtu6RxIN+aXu0LGViMDdm0L+VrwJ3Q9M2C+0PSyBSqM
 lvq1PeCyWvBlPu0hpZFVoCAnO4dAao9GQtYHommXGw51thzV2lZvNOuXY1LPkFjT
 hQt/2Lz6/x7t9zGe0oe80l5GasiLr6S6J0qF0KjePvv0pO2qvwY/kziSEhSzSeyr
 QDRqiqGITr3cIn8JtDIZHOaYNqsw9SCbvpuZ9yYq6piUfkdijrSItZhf45WPF/rA
 qkCWDYyUbcM7gFKS+laWsFAKPLD8vWYyYie7LPa3xPpZjrI9t9HGt65yGilZeXqm
 fQsWLM9Iwr80WsaJLclD8Bpyqhb+6DJbtU+FLXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Prb7tn
 3TJaxCnpwPPyi4xsZf7IapyERpEa2ECzebZJ8=; b=VR3W6WNB98Qi32CdFWRQ2z
 GL4+WEI1xXnXG+TZNDL0Zv8Pel4UGnvs4CSmGEjU+tQ71Wa3LpLjNdaM7h3U7sfM
 p8hvF1HP/AB5LMSwWyZfyo7aAiULkeXjw/CRYLXkllSIASlB4oc8fRTkQ65q4Zd8
 xB660kM38NCjQFMyTEjZ8HSxB+0SpuEp7wvnio2DnItxVBXX+K6X+YDofazAEjd6
 KyLMYkIgYeOHw7UHUvRjuuUwJQcKHuvQMVVwoPwbWFNwmQidbyOU0PqPwtoFUFDT
 gIDMGnGFwRjeGX4aO/09Ll71KOAGNGj88vKBZefQb32zxOWJ4yDAbQ7sTxESwzlg
 ==
X-ME-Sender: <xms:CnlHXR1l0V9THU39Aap7oiHt8szc2igbuZPkdhxMsB_kV48QIxL9gg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtiedgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:CnlHXUOAlGPqae4gC48F0Pt0yXZKToIbq-M1Bb9YA0UTYG5C8i7Ptg>
 <xmx:CnlHXeBB8JbU__uOJwzDKnXEOrk36kZ05q1-RetV8TWpqQwiUDOYug>
 <xmx:CnlHXTdAqWMW4DB9PQfLoKy3QyL3MHQDkxkZUV8dz2HbR2vmiUg6hA>
 <xmx:DHlHXaY6LySV9ubuK-ADN-my4zPeO3kv0jgPF40e0yMFfHbC5RU9lA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5A373E00A2; Sun,  4 Aug 2019 20:32:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-799-g925e343-fmstable-20190729v1
Mime-Version: 1.0
Message-Id: <593f30af-1065-4136-a420-3d0cf2a111f5@www.fastmail.com>
In-Reply-To: <20190802083736.26783-1-Ben_Pai@wistron.com>
References: <20190802083736.26783-1-Ben_Pai@wistron.com>
Date: Mon, 05 Aug 2019 10:02:33 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ben Pai" <Ben_Pai@wistron.com>, "Rob Herring" <robh+dt@kernel.org>,
 mark.rutland@arm.com, "Joel Stanley" <joel@jms.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] ARM: dts: aspeed: Add Mihawk BMC platform
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
Cc: wangat@tw.ibm.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 2 Aug 2019, at 18:07, Ben Pai wrote:
> The Mihawk BMC is an ASPEED ast2500 based BMC that is part of an
> OpenPower Power9 server.
> 
> Signed-off-by: Ben Pai <Ben_Pai@wistron.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
