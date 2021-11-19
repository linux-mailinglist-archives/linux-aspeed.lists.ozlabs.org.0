Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D42C3456A73
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Nov 2021 07:54:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwS7q5rg0z305K
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Nov 2021 17:54:15 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwS7g6vYBz2xYG
 for <linux-aspeed@lists.ozlabs.org>; Fri, 19 Nov 2021 17:54:07 +1100 (AEDT)
Received: from [172.16.68.9] (unknown [49.255.141.98])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 72E5F20181;
 Fri, 19 Nov 2021 14:54:03 +0800 (AWST)
Message-ID: <483e616cb69c780f6102ae058a26704a0443d38f.camel@codeconstruct.com.au>
Subject: Re: [PATCH] drm/aspeed: Fix vga_pw sysfs output
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>, Oskar Senft <osk@google.com>
Date: Fri, 19 Nov 2021 14:54:01 +0800
In-Reply-To: <20211117010145.297253-1-joel@jms.id.au>
References: <20211117010145.297253-1-joel@jms.id.au>
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
Cc: linux-aspeed@lists.ozlabs.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Joel,

> Before the drm driver had support for this file there was a driver
> that exposed the contents of the vga password register to userspace.
> It would present the entire register instead of interpreting it.
> 
> The drm implementation chose to mask of the lower bit, without
> explaining why. This breaks the existing userspace, which is looking
> for 0xa8 in the lower byte.
> 
> Change our implementation to expose the entire register.

As a userspace consumer of this:

Reviewed-by: Jeremy Kerr <jk@codeconstruct.com.au>

Thanks!


Jeremy

