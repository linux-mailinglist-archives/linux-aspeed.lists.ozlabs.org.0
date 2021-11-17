Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C150453D5C
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 01:57:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv4K41lFcz2yP5
	for <lists+linux-aspeed@lfdr.de>; Wed, 17 Nov 2021 11:57:28 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158;
 helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au;
 receiver=<UNKNOWN>)
X-Greylist: delayed 570 seconds by postgrey-1.36 at boromir;
 Wed, 17 Nov 2021 11:57:25 AEDT
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv4K16cWfz2xsp
 for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Nov 2021 11:57:25 +1100 (AEDT)
Received: from [172.16.67.241] (unknown [49.255.141.98])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 96DF120164;
 Wed, 17 Nov 2021 08:47:52 +0800 (AWST)
Message-ID: <4aa8906bdd429c878dd73139319e07f36ea584c2.camel@codeconstruct.com.au>
Subject: Re: vga_pw sysfs file
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Oskar Senft <osk@google.com>, Joel Stanley <joel@jms.id.au>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Date: Wed, 17 Nov 2021 08:47:51 +0800
In-Reply-To: <CABoTLcR2bHQCgV+ooVGE5GJ5NOeK1irDgg0P-rfErA=xbit0vg@mail.gmail.com>
References: <CABoTLcR2bHQCgV+ooVGE5GJ5NOeK1irDgg0P-rfErA=xbit0vg@mail.gmail.com>
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
Cc: Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Oskar,

I think Joel will send some details on the gfx driver side, but:

> In uart_render_controller, however, we're checking whether the bottom
> 8 bit equal to 0xa8 (why are we not checking for != 0 here?)

This is because we want to ensure that we're in the init process of the
host-side GPU driver, and not some arbitrary other access; it's been a
while since working on this, but I *think* I remember seeing other areas
of the scratch reg at non-zero values (granted, not the lower 8 bits
though...).

[There was some discussion with aspeed about the init value
of 0x0 not being guaranteed on some part of the scratch register
interface, but I don't recall what that applied to]

We could change this to != 0, but there's a solid convention that the
host-side driver is writing 0xa8 as the first part of init, so I think
the current behaviour would provide a more solid check.

Cheers,


Jeremy

