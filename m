Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 324F011A020
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Dec 2019 01:40:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XdQ14d2MzDqXv
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Dec 2019 11:40:41 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="WZnsst5W"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MW8Wdj/q"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XdPr3gSMzDqTY
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Dec 2019 11:40:32 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2672022106;
 Tue, 10 Dec 2019 19:40:30 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 10 Dec 2019 19:40:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=FonVZHXm8ET8/Gd2BoHglmFqWNBAnF8
 7T7Cuu6NkJxM=; b=WZnsst5WSd/jJyPa8/DKQT+rO94VEGhBhocBz6rMrY+rZiR
 X2exBJKINOYOkgLaGGdJbgH0tRy69OB9Gzq8LZ/AOOCrVVGFu6ItOb6NnXcVCVaP
 enPh68VBSbVd4qzIlw/4pnWmICrRW3QT9s2645nygYAxThTCB9eZh/74LN+5N5Sg
 einCMwZPVfRh44ne74vztBzfuNNtkYZaDYgFI3y9laVsPzKRbF4zw4HhAL3n78qm
 nivvSIwRd2oXq+fHH0eHmaatKRMpgBNW9b6FNuIQHqqCQLrXOsTKRSyDSOVu+rCX
 73ct1SxmkLWWmQ7Oh6BAKzU0fX0zn6swES6YgbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=FonVZH
 Xm8ET8/Gd2BoHglmFqWNBAnF87T7Cuu6NkJxM=; b=MW8Wdj/qJosAgt/7LYRH3X
 sDG15s5apG0eiHVuPdF1Kn1ugcXcdloyQF7lhPhA+DEGzZk1KTR+CT/fBo/wl1qs
 jX6GGk5dbm+NAhccxT9SdRIBarJgxVI1pIbh6+eFpXpm8TYpPAnSNblkk1YCUGpK
 sypOjl5J2/48EjbTBi5DCqOaqi6KoT5AVxXtk9JdmGlaCZjZaA654KytbPFofUHf
 cIepUtIDdr0Hgbh5QfIfkb0L2H7WgemK/N5/uX4KmQdCzPZYNYmvBv4jRtcYt8kE
 9IaZ3M4qfGrV2MU7ILUuzDKrRndH+blcTP3Dm1ggkET4T3JcGhnhCf+eLFrNOHYg
 ==
X-ME-Sender: <xms:_TrwXRXgVuKbUZ4tpqgPLTF6OlqMIUu8toDF00sZl3R8TdWbnBUDuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelgedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:_TrwXYoTPre5R7lC-A2jPAjUH52SLlHALdX9qeVfVSO_T_aLaEtFWg>
 <xmx:_TrwXVaWacl2QMmPyAnToUc2NkFCuwPJY6Xi7l0ZGJIOCPMV5MSKVw>
 <xmx:_TrwXWBTrkqAEvq1Ct9QQNC9gOsOiLnrVk_Zz-sqxpv5yDnq0VV6Pg>
 <xmx:_jrwXU4ELyPyFWcRUfAGSXU06FxcXxQzOEXLNNaHOYxm1AADXShTTA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4050AE00A2; Tue, 10 Dec 2019 19:40:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-679-g1f7ccac-fmstable-20191210v1
Mime-Version: 1.0
Message-Id: <9a4b8714-f188-4ff7-b028-92f1379cbe30@www.fastmail.com>
In-Reply-To: <1575566112-11658-5-git-send-email-eajames@linux.ibm.com>
References: <1575566112-11658-1-git-send-email-eajames@linux.ibm.com>
 <1575566112-11658-5-git-send-email-eajames@linux.ibm.com>
Date: Wed, 11 Dec 2019 11:12:08 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: =?UTF-8?Q?Re:_[PATCH_v2_04/12]_ARM:_dts:_aspeed:_ast2600:_Add_SCU_interr?=
 =?UTF-8?Q?upt_controllers?=
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
 Jason Cooper <jason@lakedaemon.net>, linux-aspeed@lists.ozlabs.org,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 tglx@linutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 6 Dec 2019, at 03:45, Eddie James wrote:
> Add nodes for the interrupt controllers provided by the SCU.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

You should split out the DT changes and send them as their own
series to Joel.
