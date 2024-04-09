Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC70989D883
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Apr 2024 13:50:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=N+uFcisz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDPR33t7Tz3dXB
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Apr 2024 21:50:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=N+uFcisz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDPQy35y0z3d2B
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Apr 2024 21:50:18 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-182-70.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7BB1B2012B;
	Tue,  9 Apr 2024 19:50:15 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1712663417;
	bh=9rFyK612cM1jcvl4RRwfyaHfPNb98GyAZs3roT0Nqd4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=N+uFciszbuJ6UrT+j6I0JFGCdyohCGr6NMFYXkkHFuP4OdBUppqNzgghaiYqP8oP7
	 ae8kZsO3KXHZYAgUp/VxiJuYEbjGqI8cGzmjPddmNPG09WZjoPHJVFr+9pl0xK04DM
	 RPsa5tn+NtLy+EOzEQDyK5hexBA2J6gcjL3f4diyZBMeC2OJ0onMJGxPLul2zL49z1
	 KXz8A7/hzdGRjkQxgp29llG9zoTyFvybqWIcsqyDrgfLrUmHEAHO09rI67t/HUqzUH
	 8d7DxvPVnLp1UDjIGhkFbVcx4aIC7hnuAj81biu28y3SFWs3+TWMSQ2Y/7KQ53ODl9
	 y6xSMR6Ac+vyw==
Message-ID: <26cd92fbbd4fdb519434dc5420714b1b20b0a94d.camel@codeconstruct.com.au>
Subject: Re: [PATCH] hwmon: (aspeed-g6-pwm-tach) Convert to platform remove
 callback returning void
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Date: Tue, 09 Apr 2024 21:20:14 +0930
In-Reply-To: <20240409085552.19868-2-u.kleine-koenig@pengutronix.de>
References: <20240409085552.19868-2-u.kleine-koenig@pengutronix.de>
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
Cc: linux-hwmon@vger.kernel.org, linux-aspeed@lists.ozlabs.org, kernel@pengutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2024-04-09 at 10:55 +0200, Uwe Kleine-K=C3=B6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Thanks!

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
