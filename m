Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5326256E3
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Nov 2022 10:31:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7tjw1vbZz3cJg
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Nov 2022 20:31:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=cbuvEWdJ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ilPKICn0;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=cbuvEWdJ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ilPKICn0;
	dkim-atps=neutral
X-Greylist: delayed 396 seconds by postgrey-1.36 at boromir; Fri, 11 Nov 2022 20:30:51 AEDT
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7tjl0k6dz301Z
	for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Nov 2022 20:30:50 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 053065C012F;
	Fri, 11 Nov 2022 04:24:10 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Fri, 11 Nov 2022 04:24:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1668158650; x=1668245050; bh=jvKlA3OV7r
	FFevtmIcLs9NyKHMfzqV49E7rrc7UO0i8=; b=cbuvEWdJdWX4sBkxvwJSnw673d
	3OMv8RK4/qxiMbEXznonexqV+zUHVFD9HPH4n8sld0q7z0F0a28DG4PB23RflHCJ
	8+iUajwLRZt3ERG7RkpsWRYHckHLq2QeRBzf9KIPB0+vzXQFkXkKpbeUs2xc47OK
	MBmj2n5iWDM0l0K27s1dT6VKj8/hBtCat/SYX6sPQ5F+aOc6RaJsHgD75oMAAb2b
	NXHgs4azYTEP7jlUsV6dPVH7vFgctJBeIegDNRWjfrfxtV4e3x5HSuqKMkFSwSmG
	5RZWd5/KJQCsRbM29y06nMjkp5D9krjfibXqjwr40HNHHABhV4iybu066KVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1668158650; x=1668245050; bh=jvKlA3OV7rFFevtmIcLs9NyKHMfz
	qV49E7rrc7UO0i8=; b=ilPKICn0TGNUOQHH867mpQv9P93PSX8kBW+A1rxFZgxz
	w9lXcnrqrisIvJpOqouUbSrYbUruLvkKmE3kb0OfHd/s5i1CY8XFkt5nyqHtuawI
	fhlx+pecP9jzgINgRVy0FxnHnzLbqM0zzSqqXq89Gzi1uAOIlBtDBhsIoykDoe0t
	Q5DM4ViJ/x0ogEpyP2ZTWQ27U99SF9wl0dVy/TqO/36Z4CrI2f8yrBJtIKpHXdyz
	JxB65SrM8vJF6yTpgkyb4u7szqMLaPsz1bLdZWwBIKBnqd4W7FrWpGXgG+N9E66l
	bOx1zuHPOjDan0aui91djAuJruwNq33nZxbBd/mblw==
X-ME-Sender: <xms:uRRuY_WiLqlTc2b33y9o7tXV1kzlA-W-aJ-K1DekvyFrIlSlQAxDVQ>
    <xme:uRRuY3mcFef8lP5wSKftrnQu0ZSGA99Vg89k4aqt0p9fvafJSCu3Js82qlQjAmKIR
    aTwTdxMoQiytwxAnHM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeigddtfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:uRRuY7attPPnxGseAUxx8xFZxobNC2y4CWqpmt0oBKP4H9thB5vaSQ>
    <xmx:uRRuY6XmqlR9yclPT0kh5fwlyVydZDSeMPLguXgz6Rl7m2RL7TXQjg>
    <xmx:uRRuY5k2XIpya8bAnbGfVdNOn7fEnuouS-lQ55FoQeMtIcm8PrW_xQ>
    <xmx:uhRuY_jOIXMVeZOYreXts0mUusF6lS7ErHnPDrAb8xOqnEksoEVpbg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AA9B2B60086; Fri, 11 Nov 2022 04:24:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <115eb408-1c59-49d6-9fca-c7b56431f472@app.fastmail.com>
In-Reply-To:  <CACPK8XdkXaVXzabFM-g6xQ1CBjZheiP9oFrYk5o1__QR7WBcdw@mail.gmail.com>
References: <20221110013438.16212-1-zev@bewilderbeest.net>
 <CACPK8XdkXaVXzabFM-g6xQ1CBjZheiP9oFrYk5o1__QR7WBcdw@mail.gmail.com>
Date: Fri, 11 Nov 2022 10:23:48 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Joel Stanley" <joel@jms.id.au>, "Zev Weiss" <zev@bewilderbeest.net>
Subject: Re: [PATCH] MAINTAINERS: aspeed: Update git tree URL
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
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Nov 11, 2022, at 06:58, Joel Stanley wrote:
> On Thu, 10 Nov 2022 at 01:34, Zev Weiss <zev@bewilderbeest.net> wrote:
>>
>> The description for joel/aspeed.git on git.kernel.org currently says:
>>
>>     Old Aspeed tree. Please see joel/bmc.git
>>
>> Let's update MAINTAINERS accordingly.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>
> Thanks!
>
> Acked-by: Joel Stanley <joel@jms.id.au>
>
> Arnd, does the soc team have a branch for these?
>

I usually treat updates to the MAITNAINERS file as bugfixes and
merge them for the current release, as there is generally no risk
of regressions, and it's better to have up-to-date information
in the release kernel.

      Arnd
