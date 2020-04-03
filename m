Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DD919CDD2
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Apr 2020 02:32:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tgr91nP5zDr15
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Apr 2020 11:32:41 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=Rm0wLfSN; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=kmbIfeAf; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tgqv3mbxzDqbs
 for <linux-aspeed@lists.ozlabs.org>; Fri,  3 Apr 2020 11:32:26 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A273F5C02FA;
 Thu,  2 Apr 2020 20:32:21 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 02 Apr 2020 20:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=LkWwfmUQHqYqlnvd8zxThHRzsAgIZHe
 hDpsmbY7QtMk=; b=Rm0wLfSNFVZ5Il6PlDetGYdhLi+2EzgyGJ8CkMX7C3hPUdd
 hHitR413r35ldvcLY6KWAdk8bClsD6ta4ZwltkNJvnNJWZHEQlhw6O9G9Al0xhN4
 w9WjLYRTDHXSj7qLhHKNDovRkxhbRAcKEQaGauCQtias3VvuWl7dEO++jAhSjGEP
 BUxGPFEJfXs4qLIZuD5AqQNzPee0LCmZSBmVNR/3pwjgPLg5DRc4RNGh9O28TZR5
 /juQXV3bpZUOaiadfgKNBYRc6hHzgt0nsE4jIqUXpemP5H+Hk14YA6Tj9oZBuYlM
 MMngz9rsUzhtscwQ9tE5sKWjUlYkh58Yj7KIAEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=LkWwfm
 UQHqYqlnvd8zxThHRzsAgIZHehDpsmbY7QtMk=; b=kmbIfeAfLHy+eo4h1JEy+/
 yINlUvUuJqEExMlFqxMHpOhEMGnHc9Ndi4rnPlorQKtlJHZDlczVBkJ/uRyf2SDY
 gt8lFZ1eUONZLWbPKkZDjryxJJNB214zxAJjQkOfZDwyzD0iGwz4Ov4UnhpGedae
 9E/V7qcXC56fjLlhMoA2GTsUBKyrshPFBpnPgz9TSBIi0rJju9k4diKOIlQ6OYcE
 /tyLD731qh+Rcq0RGRRJoR6cj5iTHvpJcTIGhCmSbHyMZ4lcCEj+F+j2FMbN2Vlk
 9l9uE9bJcTmIG/29AFWI+KloFbUn6LGN+tyQZexTiPF//ODomDsGU90zGys80Y7A
 ==
X-ME-Sender: <xms:FISGXo0AtIezSwEUulMpaimthn2b-cZNTOI76hAMLpRBEVmwQBG7Kw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdehgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:FISGXvObzOdOpmoltqeidVZqBr4o6bUEHdX9nvkuBBN4Q7Hgnsq7Og>
 <xmx:FISGXu9n0CUoEUT7YQh3cg4e7bXpX156aKwTdge30vWXiDGUw1kjWQ>
 <xmx:FISGXpJF6oJ_qpM8ORDnzCPok6UGEnxY4NUX4edekqTvbNsqCHPl3g>
 <xmx:FYSGXkEmstYTkXivRx6fcfv_MfqxsWlj0Ps1gqXrOGyLzaCsDjk8ow>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B0678E00B0; Thu,  2 Apr 2020 20:32:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1080-gca5de7b-fmstable-20200402v5
Mime-Version: 1.0
Message-Id: <8ca08ea0-2f3e-4b44-a595-bfe96ca02b3f@www.fastmail.com>
In-Reply-To: <20200402194955.16643-1-eajames@linux.ibm.com>
References: <20200402194955.16643-1-eajames@linux.ibm.com>
Date: Fri, 03 Apr 2020 11:02:41 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v7 0/5] soc: aspeed: Add XDMA engine driver
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 3 Apr 2020, at 06:19, Eddie James wrote:
> This series adds a driver to control the Aspeed XDMA engine embedded in the
> AST2500 and AST2600. The XDMA engine performs automatic DMA operations
> over PCI-E between the Aspeed SOC (acting as a BMC) and a host processor.
> 
> Changes since v6:
>  - See individual patches

v7 is not an evolution on v6 - v7 contains a bunch of bugs that v6 fixed (at least
wrt locking). How did you generate this series?

Also my name is misspelled in each of the Reviewed-by: tags which makes me
think that something has gone quite wrong with the posting of v7, and I'm
concerned that this was based on e.g. v5 but with my tags against v6 applied.

Andrew
