Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C633A601A8F
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Oct 2022 22:48:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrpxJ4CDJz3dqh
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Oct 2022 07:48:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=S1+0HT3x;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=S1+0HT3x;
	dkim-atps=neutral
X-Greylist: delayed 473 seconds by postgrey-1.36 at boromir; Tue, 18 Oct 2022 07:48:28 AEDT
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mrpx83JW6z2xHT
	for <linux-aspeed@lists.ozlabs.org>; Tue, 18 Oct 2022 07:48:28 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 608DEF7;
	Mon, 17 Oct 2022 13:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1666039229;
	bh=PtDkX7PN/aXZdmcB5xQ1pSmiMMClWzn8+l9E46Zb+/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S1+0HT3xKjWKenhMqW7eFJIOAUQWxuFfz7VnDgIjyKHDkAmY/t7tYlnSonOA28j7T
	 v/UBcLHfnMuvTAayb0FpaCJBY614VUMbzJSy/LY7Vbuvs36jZ/hjH2y22Xubj/hv2K
	 KdqegozbG+83pOBx8Coyo4saSs6HvWuKjy9MWqBc=
Date: Mon, 17 Oct 2022 13:40:27 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] usb: gadget: aspeed: Fix probe regression
Message-ID: <Y029u+ZZZikW4fYl@hatter.bewilderbeest.net>
References: <20221017053006.358520-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221017053006.358520-1-joel@jms.id.au>
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, Oct 16, 2022 at 10:30:06PM PDT, Joel Stanley wrote:
>Since commit fc274c1e9973 ("USB: gadget: Add a new bus for gadgets"),
>the gadget devices are proper driver core devices, which caused each
>device to request pinmux settings:
>
> aspeed_vhub 1e6a0000.usb-vhub: Initialized virtual hub in USB2 mode
> aspeed-g5-pinctrl 1e6e2080.pinctrl: pin A7 already requested by 1e6a0000.usb-vhub; cannot claim for gadget.0
> aspeed-g5-pinctrl 1e6e2080.pinctrl: pin-232 (gadget.0) status -22
> aspeed-g5-pinctrl 1e6e2080.pinctrl: could not request pin 232 (A7) from group USB2AD  on device aspeed-g5-pinctrl
> g_mass_storage gadget.0: Error applying setting, reverse things back
>
>The vhub driver has already claimed the pins, so prevent the gadgets
>from requesting them too by setting the magic of_node_reused flag. This
>causes the driver core to skip the mux request.
>
>Reported-by: Zev Weiss <zev@bewilderbeest.net>
>Reported-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
>Fixes: fc274c1e9973 ("USB: gadget: Add a new bus for gadgets")
>Cc: stable@vger.kernel.org
>Signed-off-by: Joel Stanley <joel@jms.id.au>

Thanks Joel!

Tested-by: Zev Weiss <zev@bewilderbeest.net>

