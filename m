Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 421B626D04F
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Sep 2020 02:59:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsJXT46m1zDr3b
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Sep 2020 10:59:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=AMyWWxfG; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=i8boKf4s; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsJ195rTPzDqCX
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Sep 2020 10:36:04 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9EF8F5C0B32;
 Wed, 16 Sep 2020 19:19:09 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 16 Sep 2020 19:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=ufhbt6faR1NRPvUIbmKhQAxa20q9jhC
 pWFUZmwGyja4=; b=AMyWWxfGg2pmR+6vRfITC2fhxfWdl59UR2dDL3wqtldj8WS
 S8ZOJm21iP98N36Rq0nd779a0STS4bH/SDhikNLObiRi0DhUhXet3AJ7Ajy32UiG
 nb1ihPAAxhtxv6hVXaSEJ8v/eDn/Oz0q734po8WDnTrq91ghFjndIc689rPDqu9i
 ttuhEYd8vNhM9H9FLND6oXYeWP2AvUIpVZbhJffhZzc/QarjwI6/1aQw+8wES/94
 tUb7S21TGhdmRbZP+o/SyiQ22MawJE7VUTaqZQXlz8bqxL4RoXCMIgsm0BpctRZ7
 +zvpp+Q22NYhYFPuSEmB+71PnIf9BPgiLY8kq9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ufhbt6
 faR1NRPvUIbmKhQAxa20q9jhCpWFUZmwGyja4=; b=i8boKf4skqHxcCdNxUDCv8
 8YbETZ8cmZ+LiOpBAhbOwRAfJLdylJK/mphLn8idg8E/yA2vtefkVFbi89tfld9v
 E3nKvQQ9JH+jVgKFKilrc6Szp7VFYP15oee5FgSAU9k73fKphQKYX7Ma3R0KFYoE
 WHGqC2tf148DSqdkjCqTgDgmplBBIzJyqlq4Zkn8CpTmRhY5vX/0uIl/j4xjIZ3N
 sR4apiah52sgToCA7BS0wN/Rp6p6twnMgLyf4IJTgcmpStF8q43Tq3FtetW8xiPx
 LVG2yrsbQ9WCpaQGsc044vATFHfFoLh+y36e66XekJw2+9n3hlRi7lDImCXaXyAA
 ==
X-ME-Sender: <xms:ap1iXwwZH-zp5py9OCewW4mRYhM2B0jXxzndzBohX5qZpNGLELPX5w>
 <xme:ap1iX0SOxEBMr3TM-7PyvzmD-zzLUbN9Th-MjemRiElS7w3J_h4MURLrpa7Bbpayt
 uJQZIip8cwWgJsU4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdefgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:ap1iXyUDkkEEio7uYfaDRt1reNPGK-_vq6bbiqg-IFAWafUnKuNKVQ>
 <xmx:ap1iX-gA_lrbfyQ2a2e2IhGRc8sS0kTECvDUQtv2qtmgfpYFNsjkKA>
 <xmx:ap1iXyCXGjX3mH2QOHZfT5IRy1x9T8z7lDi9BZzHp6oepPVTEPStGA>
 <xmx:bZ1iX1NotdCEdjK_46BzQS5Q4qCJ7LOTv09NxxDG7qCY52QxylhUdg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DB930E00D1; Wed, 16 Sep 2020 19:19:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-324-g0f99587-fm-20200916.004-g0f995879
Mime-Version: 1.0
Message-Id: <2a1617a0-5106-4b23-92fd-870b319e7598@www.fastmail.com>
In-Reply-To: <20200916125731.784527-1-joel@jms.id.au>
References: <20200916125731.784527-1-joel@jms.id.au>
Date: Thu, 17 Sep 2020 08:48:45 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH] soc: aspeed: Improve kconfig
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 16 Sep 2020, at 22:27, Joel Stanley wrote:
> Reword the kconfig text to be consistent and reflect that most drivers
> are available for all supported ASPEED chips (2400, 2500 and 2600).
> 
> Rearrange the symbols the SoC drivers depend on so the menu doesn't
> appear unless you are building for ASPEED for compile testing.
> 
> The SYSCON_MFD and REGMAP options are usually selected by drivers that
> need them, so do this.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
