Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 008D0160766
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Feb 2020 00:57:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LPDW0ZLXzDqTP
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Feb 2020 10:57:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=rcplxmb/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=lq1ibPzk; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LPDN1vpXzDqRq
 for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Feb 2020 10:57:08 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id BF5DB23D1;
 Sun, 16 Feb 2020 18:57:05 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 16 Feb 2020 18:57:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=Iq3LVkD0V43Pc+mO0wAfFqV5qSaPvQ/
 MM4fB/BoXF80=; b=rcplxmb/8uWm7hKf+9c9zjG9b88Q8NCjzvGSxUne58cHaK5
 AGJhSJkKKdRdGy/8SFYXzKicYHBTdfm4Mv/j9go6EoTaIFAoFzkX7YFlMNjcEgyq
 1As7W1TLCXXLGFD7f3i1uNFtEs7bMNyBGDTCZMQja640DU9muoOv/sRp/Ql04zBe
 G/CTYIWMRHXdTstH4u7DQRtdwFJP2mFIBhNVfAiKTKDTt3ziZr9cvBH+ORaSfDYl
 fVPXs1iHNwHc3GfRwT1UHXLX+F3hNv2uC+FtYdd45N33kcu93E2ccWrYHHpfzw1X
 1TG3oohc3u2Tj/Ys8Xn2Rog9DB1fG33VvhltpfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Iq3LVk
 D0V43Pc+mO0wAfFqV5qSaPvQ/MM4fB/BoXF80=; b=lq1ibPzkpvgjiRKofRT7M1
 CJUr2d1nf4CUXLJnak+rjb0fZRWL0VhhuU+rrO35vEmz7Jw1+QMVBIu/b/h7rLJi
 lHiZeyqbeBUNCJ7945aOHA9WnOIlcudgWi9R8MAv3CbMOzMdqyk0UzeDgy8TuKD4
 csdlzFjeXRtbco+GhyUihPe62TfyXN8ww4hxA34/9mMYmvZBC0zCuD/sxtEsfXdr
 cA2mBC2oA6FQ34SzK5C9v2g9Cmqc3r3bqFaZ8QPPjmqfJy5WWAaTwAAquf4iHyDz
 izgPv1QSnIshP1wmDLuHQ2XPZxY21Ym/hHqx+XqYiZlbujMYyzj93NC/FbiCLu2g
 ==
X-ME-Sender: <xms:0NZJXkTfPWJ7ph-BGf8lw6Y4BnRRam1vXMEO3UDOX9D6kKJI4OosKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdduhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:0NZJXntJj7JYT3Gh4F196g4BvCaz567U-g7331QHejM-Tv7EgdBvig>
 <xmx:0NZJXu9q2I8QUBF1xwuRXsq73ydIXGF39keIKWrbXbHNdpderRJMAg>
 <xmx:0NZJXoxMdh764fHv5nMSvf75ZYqa3ttgzcooKbyaWhXrpYSwRm6Ctg>
 <xmx:0dZJXgjvk7IAxL22y8MzPM2A7xInaTSyZYyqGo_jZOroRQcB-t5T1A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EE60AE00A2; Sun, 16 Feb 2020 18:57:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-802-g7a41c81-fmstable-20200203v1
Mime-Version: 1.0
Message-Id: <3a053c3e-0fec-4ab9-b941-a335524b3303@www.fastmail.com>
In-Reply-To: <CAK8P3a3HsdpLz0aDGem1BrQsNo2mEJOnOsLcKFcLjaERx9dhGg@mail.gmail.com>
References: <1579123790-6894-1-git-send-email-eajames@linux.ibm.com>
 <1579123790-6894-7-git-send-email-eajames@linux.ibm.com>
 <CAK8P3a3HsdpLz0aDGem1BrQsNo2mEJOnOsLcKFcLjaERx9dhGg@mail.gmail.com>
Date: Mon, 17 Feb 2020 10:26:57 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Arnd Bergmann" <arnd@arndb.de>, "Eddie James" <eajames@linux.ibm.com>
Subject: Re: [PATCH v6 06/12] soc: aspeed: Add XDMA Engine Driver
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Jason Cooper <jason@lakedaemon.net>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Marc Zyngier <maz@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Tue, 11 Feb 2020, at 03:05, Arnd Bergmann wrote:
> On Wed, Jan 15, 2020 at 10:31 PM Eddie James <eajames@linux.ibm.com> wrote:
> >
> > The XDMA engine embedded in the AST2500 and AST2600 SOCs performs PCI
> > DMA operations between the SOC (acting as a BMC) and a host processor
> > in a server.
> >
> > This commit adds a driver to control the XDMA engine and adds functions
> > to initialize the hardware and memory and start DMA operations.
> >
> > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> 
> Hi Eddie,
> 
> I'm missing the bigger picture in the description here, how does this fit into
> the PCIe endpoint framework and the dmaengine subsystem?
> 
> Does the AST2500 show up as a PCIe device in the host, or do you just
> inject DMAs into the host and hope that bypasses the IOMMU?

The host needs to coordinate out-of-band with the BMC to communicate host
addresses to be used. The host should configure the IOMMU as required before
triggering transfers (either from it's own XDMA interface or requesting the BMC
queue the transfer).

Andrew
