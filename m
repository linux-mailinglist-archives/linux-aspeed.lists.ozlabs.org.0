Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9A1265670
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 03:12:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bnd5b5jSmzDqjj
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Sep 2020 11:12:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=103.231.89.101;
 helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=codeconstruct.com.au
X-Greylist: delayed 100 seconds by postgrey-1.36 at bilbo;
 Fri, 11 Sep 2020 11:12:15 AEST
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [103.231.89.101])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bnd5W0Jz9zDqjj
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Sep 2020 11:12:14 +1000 (AEST)
Received: from pecola.lan (180-150-121-66.b49679.p1.nbn.aussiebb.net
 [180.150.121.66])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6CAA43FEF4;
 Thu, 10 Sep 2020 21:12:11 -0400 (EDT)
Message-ID: <5d953d84c8b84d182068329db124517f8c5603b8.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/2] gpio/aspeed-sgpio: don't enable all interrupts by
 default
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Sep 2020 09:12:11 +0800
In-Reply-To: <CACPK8XdOTorJcNSON--LZU8XkWLh5kwXc8fkGWOBmXVnFiCnSQ@mail.gmail.com>
References: <20200715135418.3194860-1-jk@codeconstruct.com.au>
 <20200715135418.3194860-2-jk@codeconstruct.com.au>
 <CACPK8XdOTorJcNSON--LZU8XkWLh5kwXc8fkGWOBmXVnFiCnSQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-2 
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Joel,

> And also removing the enabling of IRQs. This part makes sense, as
> it's what the commit message says.
> 
> If you think a sensible default should be single edge (and I would
> agree with that change), perhaps update the comment to say "set
> single edge trigger mode" and mention it in your commit message.

OK, shall do. That was my intention with the "reasonable defaults"
reference, but being explicit about that better here.

I'll send a v2 with an updated commit message.

Cheers,


Jeremy


