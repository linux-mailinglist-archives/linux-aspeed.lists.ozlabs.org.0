Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A1A6772F6
	for <lists+linux-aspeed@lfdr.de>; Sun, 22 Jan 2023 23:17:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0SKV0sFFz3cCN
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 09:17:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=GKctyZpU;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=k2M7nn9e;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=GKctyZpU;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=k2M7nn9e;
	dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0SKH3lCqz3bNr
	for <linux-aspeed@lists.ozlabs.org>; Mon, 23 Jan 2023 09:17:38 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id B8E2D32004AE;
	Sun, 22 Jan 2023 17:17:32 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Sun, 22 Jan 2023 17:17:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674425852; x=1674512252; bh=UuPp1oPilX
	K0psEaA3tJMqfMqD3ye1eT6C3/Et7kkQk=; b=GKctyZpUbTZTKehS432XujdL/p
	SdWLQphFlMIg69htV2BpAkunvSZWvWO6XM9LMBdK+BWaBeQ0qIiUZ8pQMWUEor2I
	cTEiO+3q4V22QgFqJCqU48SierbTxJxzJlWnI9NNPdynIaMJCAtzFTaJpaqyb6RF
	UFi8NQunAzsyNJ5Jctna1mH2ao82SGtF7SqP7pJPbuap1upOUmF+PN1Lkp3YqyD3
	OLZbFzcCyozLvBHiMmGPZvNvMfyV8i90KrgMXrMr5duoWXX3/ttB1fNWLToOOcnf
	XNa3Vqx8zCKgXG+CD/RGvtl0/mtydHYS44CMefePKBv/QWLSQP3rBUrr6Zlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674425852; x=1674512252; bh=UuPp1oPilXK0psEaA3tJMqfMqD3y
	e1eT6C3/Et7kkQk=; b=k2M7nn9eYIQ1i1mGzOq675wcIuGHH6AYkbbKIHfYPZBt
	N1Hat5UXu2srAKlI1YTuW4eKulKjqx3owwBTQChiVc3Yo2oWa/eioIfidg13gRbF
	pfgpbBlflWsF8Ww+1lxb7Vk2TrqrhPxP9hvhS/sec8SOMa3Y5sOzYxC597yGvRWS
	XACgjW0NHm694PCYjGGqyrpObDBFDBnPoR7xqudLmSCByfLef3lLGnL/Mg+QM0rY
	r2ysQCoU0LdY6qaUdX4NbHX5RyYbsJb0RQWYisNss0Hbdr7RjYJ8WoNSnAcispOI
	3YBun2AaLmlorSaA/F26JIFKEHich+srTpvyJmKRvA==
X-ME-Sender: <xms:-7XNY2m8PhJJt6vdpxVfynL82b8vlq-_CO5l2XgwvT_YnLiKGfVLaw>
    <xme:-7XNY92qviibGu-4bWjYKKYvyhxkFWw0AXVki26fwVnanwDAXHzMbs09kAnheiaAL
    lEUwGPxl3cYKNWUCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduiedgudeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedv
    hefhveeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:-7XNY0qmzcfOrO7IUMmjR7j_T4JsGqHav4XaiNHrO-C_5dJihchXAQ>
    <xmx:-7XNY6m1EZOsWFaXk_aGsmvbQWqC6A9UKK0-uO827Zo4A4BOJn5ZuA>
    <xmx:-7XNY03zz8kl65I8Cx7X61UhTM1BRR2MQkRS35301UPL8j96N3Cjhg>
    <xmx:_LXNY5-CyaIHR4N6-WWmlxjKM0rulEsf6IRbdOG9swT84Yg_SPmTuA>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7DFA61700089; Sun, 22 Jan 2023 17:17:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <79c1441e-20dd-4c2a-8dfc-a8fdaded20b7@app.fastmail.com>
In-Reply-To:  <CAJTGxZH2VAn8-=LKuA76bGkrXtm1y99LW_-yDqh52UX7Kd4tZw@mail.gmail.com>
References:  <CAJTGxZH2VAn8-=LKuA76bGkrXtm1y99LW_-yDqh52UX7Kd4tZw@mail.gmail.com>
Date: Mon, 23 Jan 2023 08:47:10 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Vijay Khemka" <vijaykhemkalinux@gmail.com>,
 linux-aspeed@lists.ozlabs.org, "Joel Stanley" <joel@jms.id.au>
Subject: Re: KCS over eSPI
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Sat, 21 Jan 2023, at 11:40, Vijay Khemka wrote:
> Team,
> I am planning to use eSPI interface instead of LPC on aspeed. I see some
> patches by intel for espi slave driver but I need to integrate this with
> KCS. Our current upstream version of KCS only supports LPC. Please point me
> to any patches available to support KCS over eSPI.

Aspeed were doing some work for eSPI support a while back, but beyond 
that I'm not aware of any patches to bring to your attention. Also, IBM 
isn't planning on exploiting eSPI from what I know, so I don't think 
we'll have much motivation to get the driver side of things worked out 
ourselves.

Andrew
