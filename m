Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9B540428A
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Sep 2021 03:06:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4gnm1n34z2yJ7
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Sep 2021 11:06:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158;
 helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au;
 receiver=<UNKNOWN>)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4gnd5rzGz2xrH
 for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Sep 2021 11:06:45 +1000 (AEST)
Received: from [172.16.66.38] (unknown [49.255.141.98])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E3AAF2012C;
 Thu,  9 Sep 2021 09:06:40 +0800 (AWST)
Message-ID: <4df4622ca3c05cff2ce219f93edc2be433114978.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add TYAN S7106 BMC machine
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Oskar Senft <osk@google.com>, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org
Date: Thu, 09 Sep 2021 09:06:40 +0800
In-Reply-To: <20210909004920.1634322-1-osk@google.com>
References: <20210909004920.1634322-1-osk@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Jason Hargis <jason.hargis@equuscs.com>, Ed Tanous <ed@tanous.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Oskar,

> The TYAN S7106 is a server platform with an ASPEED AST2500 BMC.

Looks good, thanks for this.

Reviewed-by: Jeremy Kerr <jk@codeconstruct.com.au>

Cheers,


Jeremy

