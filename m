Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE71495C400
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Aug 2024 06:02:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqmbx3qYvz2ypx
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Aug 2024 14:02:05 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724385723;
	cv=none; b=N8ktA0KlTaJctOfucYR0iheTBeVHxuOQVCJb5twDT586NWSlMafdL8cD6OvNiALksQtfVp1jlj7oL7CZjVBcA2weudCavCjjsgtAaiikKI60TFi3UJ23YqWBUuVZ5kt708BIv6+H3Tcj7NnvucdWrEoxqXJ3tQwM5lqSd2hJ2IFXaZ09rHDhXnbTqeaPW1H6TeVl25pzTghUPVIi85OQN9InSQFQ9kv9O+CXQTohEIVgLFhPKERtQTXDOv45hv2iB6gvSJldJq9+PW2yLyzDjY8EpZ2dkl5TNgP1i+3c6ueX5qH+FpHsP80k1lC0fTy1+YFHJ6Uz4cZSwRnfCsfb4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724385723; c=relaxed/relaxed;
	bh=0BGNICJbwFRbFS1gHm/2X9vvhx5Sb5WbrQh56cS3mT4=;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version; b=ImYLIXQXTl/ba8AXgX9REqTfHa3VPvCy2mn+LAugjWMZbk2yucuznepuBGJx4CGs4OemXsTf41IygnMTxicFuVDNw0iLjoSReVMFFC/Br/H1PLQc9zRHHK7z/G4nF6eqoSIuDQYycT3XjcQyElRpeQ6j1oOZaILf/IbHCwSS279XuhdjsotUvahRas7ds3rGJJ9UywnBzT7Rp3zbEreceYakFhB6bZ/dtWFpn5PKkfZRaCfK8XAaofJi5pyzw6tNAHVRBTzHFJ15wuq/vKE7gVqcI7S4PZ/qFiAOzpKgiYOzJg9l50JlnoRKwUAbp2K6E6rDqvty+ikV1yNW/zh5Ow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=j+MFA5fJ; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=j+MFA5fJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqmbv3tpNz2yGD
	for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Aug 2024 14:02:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1724385722;
	bh=0BGNICJbwFRbFS1gHm/2X9vvhx5Sb5WbrQh56cS3mT4=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=j+MFA5fJ9hUgfFIylGi9G9nMVRforRkgUYH5GYm69oSw6hyruhEDiqao4cfVm/+Ew
	 o3+YI0nTXOGpKMqQeVYfS+x+akKjmE2k8wWeNsCA1v+cyKDar9umb+TUlJxoTwzieL
	 tylfz/E35l0qBRLNmjpTipPVpXYeh5HNSq5ilIKGfmJv9k91s4lEVlrOUJYkFMsUc6
	 wjTTHEYNZ31HsaNfE4i6VPSXyxzrGGO3hYLKceb58ZmyhQGR+lN8d4/6UvQKOcP5R6
	 8x/4klW1BUGz8ymAg67AVzbMI1K9fym4PKCu/iprQV2mfdISg7NCMPybjzgDKn9B3D
	 QuAi8c4FAA6sA==
Received: from [192.168.68.112] (ppp118-210-185-99.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.99])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7ABB564FDE;
	Fri, 23 Aug 2024 12:02:01 +0800 (AWST)
Message-ID: <d3f26b403f8a281ed44c70bc04bbe42c4a9c29d3.camel@codeconstruct.com.au>
Subject: Re: [PATCH -next 1/8] hwmon: (aspeed-g6-pwm-tacho): Simplify with
 scoped for each OF child loop
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jinjie Ruan <ruanjinjie@huawei.com>, jdelvare@suse.com,
 linux@roeck-us.net,  joel@jms.id.au, linux-hwmon@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Date: Fri, 23 Aug 2024 13:32:00 +0930
In-Reply-To: <20240822062956.3490387-2-ruanjinjie@huawei.com>
References: <20240822062956.3490387-1-ruanjinjie@huawei.com>
	 <20240822062956.3490387-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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

On Thu, 2024-08-22 at 14:29 +0800, Jinjie Ruan wrote:
> Use scoped for_each_child_of_node_scoped() when iterating over device
> nodes to make code a bit simpler.
>=20
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
