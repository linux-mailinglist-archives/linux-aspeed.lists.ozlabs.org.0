Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 163BD19E9A8
	for <lists+linux-aspeed@lfdr.de>; Sun,  5 Apr 2020 09:00:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48w4L70QzwzDr7D
	for <lists+linux-aspeed@lfdr.de>; Sun,  5 Apr 2020 16:59:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=goGwj/jm; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=QQpV+ip6; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48w4L14zxRzDqd1
 for <linux-aspeed@lists.ozlabs.org>; Sun,  5 Apr 2020 16:59:53 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id AAEDE58026A;
 Sun,  5 Apr 2020 02:59:50 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 05 Apr 2020 02:59:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=yWE5iV1vF2rjVGqJzP4udG6OgWvMuVf
 D2zKlW0VL8vc=; b=goGwj/jmvd74/4dXXrkmJVPe5xI9r3yKgasZjk9WlI8sZvA
 Hq8FllL86de3H+jkfEIilxOxo12fkh/uZUGny/AvGivr3scfemC7SN6haQ8cLUDX
 kNhFTFxt3PvIwPTWj8+orWCj7oZPLvd5Jy1TS0VAMqEv9td8mDYMkk8gex5pvoeA
 ucNFcYwGXilpC8XYUKedvB+1ommO41Vzbiusd1/aW5yknjdpImx7oilaa+/dl9qW
 KE3k6T7vf1ggYLO/YNXbgb4F8FxAlcVUZ/d5VQ+sZyJEYLzQw5rkmZD96vbYLLu/
 Vlukw8OOzCVMFp3RsorCHmsR+YcxKKESTznHguA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=yWE5iV
 1vF2rjVGqJzP4udG6OgWvMuVfD2zKlW0VL8vc=; b=QQpV+ip6yBO7k7deoxKGUs
 rW3WfZZP7kKZy5IZipRQlASYytedxXztVz9s6lAsbr9r1rfrO4aaV5W/NgiNkG2E
 dcwvdQ+XbPv7RwpPM2Ek7A+AqhaYPEQtoEg8FP2ct2LKqXsA//neIK5q0H5Kmv9p
 ESfTAcXiw+aRhyXlvNuR5YKUOayawJtEIkwpYkOO6fSTgb142/azseN7ik/FsTbf
 JdXgvn/gh/lkZtCk6sYTR3NB8gvhSy+5/RNDytiIgGfJH0n0RNJG5OJg8SLaezdB
 dnVkGcD2iuBA+cRfi5P7ID9bOvcIdfhofBrMax6bBiggzvEoSgEP/OpDUMvMtw1Q
 ==
X-ME-Sender: <xms:5IGJXgh39OEGA02bB29v2YQALa7x8qIPFiG_n0zd-ko5F5rCutG2cA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtgddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepkhgvrhhnvghlrdhorhhgpdguvghvihgtvghsrdhpihhnghenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiug
 drrghu
X-ME-Proxy: <xmx:5IGJXoUMkaRJo6jN3vOIm7edHXudlz9cSM0j6tpYFurIuA7U-IYdnQ>
 <xmx:5IGJXvCM5nfC-tJ_HT3EdJZkXcpgb3h5JENEvcJysnffznYFloNhjw>
 <xmx:5IGJXslnrlyKOycSkd-ZzaXEsrp6Cgglk7UNiANZGtnAa-OYfektrg>
 <xmx:5oGJXtU6C2CZPne5rDC3sbV-JSzh2weW3z2qanuGgwholBRpBXk-Qg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A15A8E00B1; Sun,  5 Apr 2020 02:59:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1082-g13d7805-fmstable-20200403v1
Mime-Version: 1.0
Message-Id: <69bfc045-2059-4d37-af7a-52f5840664cf@www.fastmail.com>
In-Reply-To: <20200403130840.GR2910@minyard.net>
References: <cover.fe20dfec1a7c91771c6bb574814ffb4bb49e2136.1576462051.git-series.andrew@aj.id.au>
 <7734002a-181e-4baf-b9a3-af66894acc16@www.fastmail.com>
 <20200403130840.GR2910@minyard.net>
Date: Sun, 05 Apr 2020 16:30:09 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Corey Minyard" <minyard@acm.org>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_0/3]_ipmi:_kcs-bmc:_Rework_bindings_to_clean_up_?=
 =?UTF-8?Q?DT_warnings?=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 3 Apr 2020, at 23:38, Corey Minyard wrote:
> On Fri, Apr 03, 2020 at 02:20:21PM +1030, Andrew Jeffery wrote:
> > 
> > 
> > On Mon, 16 Dec 2019, at 12:57, Andrew Jeffery wrote:
> > > Hello,
> > > 
> > > This is a short series reworking the devicetree binding and driver for the
> > > ASPEED BMC KCS devices. With the number of supported ASPEED BMC devicetrees the
> > > changes enable removal of more than 100 lines of warning output from dtc.
> > > 
> > > v1 can be found here:
> > > 
> > > https://lore.kernel.org/lkml/cover.5630f63168ad5cddf02e9796106f8e086c196907.1575376664.git-series.andrew@aj.id.au/
> > > 
> > > v2 cleans up the commit message of 2/3 and changes the name of the property
> > > governing the LPC IO address for the KCS devices.
> > 
> > Ping?
> 
> Sorry, I've been busy.

No worries, so have I. I was surprised when I found it had been 4 months :)

>  I've looked this over and it seems ok, and it's
> in my next tree.

Thanks.

Andrew
