Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 237EE975F01
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 04:40:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X41rf6MPJz2yRM
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 12:40:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726108832;
	cv=none; b=KZTWwij/+1zWja9vylx+DHL0+HyYS22pbLZx4RACzDyii4DB8XNrNa/2szl/FkyF7dj3OzpT/x/6hTp7ztzINzTX0Ogdl7eFYju82V7Gp9RPOeCcTKXJ8poDRg7LExYbrCnDv/R1fXyr7ef4uLzggv7oiCulhdAeKcR6z5xMDnMJs0FEhpXqC5uzSx774RwlOHCVFKe11dfpvcLBUDKGPD/v/VSbVP7+BGlZeFudBUk8oZnt7037tb3u5/Fa7jzwy/Ynh6BCuXWoldnqN623oXZy4WCBgN3J0TQy7WWwRyUvmP+hemodcH0iKA0+D7GrlVpBvTgsNcNlFlGkEkAQig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726108832; c=relaxed/relaxed;
	bh=c6C5+9co9bNXfuUc3JS4ckFeninBzAqCfURuN1k4pZA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iPyczdhJ/q7DJtsfrfdz9UeLq4B8vw5JV8oYGcjYGjmEKTG4OQEduRa3p4hvO48Ff43VajTJhs6XyP28L7E33/fWjtB1dIkA9vyc1MsmIfcN3jrEyy4tSlQludIlv46LxTym5HpEVqrpmbVtZLZanEnADWzBTDzQLA3w1SW41cCi112U2pryez0r4FQiFFSQUwL6LbRaZm9FZ0yG1XH0ZsZQgx/FCnBC+itufFi8y9hENoVHlRmbMXi1gkJcZrgxrWM/SamSGmCwR/B/8OIyMCM+672wtdOTNK7G8+qCZFicSSwsQgSMXrZmBPdt1whDjuw4x0p7puLJbIHkH22mAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ciVd/Z3g; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ciVd/Z3g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X41rc6GN1z2xk7
	for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Sep 2024 12:40:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726108832;
	bh=c6C5+9co9bNXfuUc3JS4ckFeninBzAqCfURuN1k4pZA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ciVd/Z3gf/OUc0zm1DiU4yeFezG8V+ULE6dwuNu4o8IKQvceXfHurAM7PCm6lAH0C
	 luKNIdL1sCeQSGwUk79BGusCagPxiWjfMlnwvtkFIjPzXulNmyr7wa2JJ0WRgGJsAN
	 vgjd8M9yXIitofy6wcOVq28uVvCNoUm8IWN5owoNOATMtGFfzsb1DcmJ/5QM5UlQDS
	 6Abdano821Kg/CFtrGPa3/11x7fg9TSBJw1GREyuER9YI3xV4VWqhIl7Cm8iCuH3/8
	 mIpjGyKBaV98jFQIWez73s6nKp1nidPUMR/z0pGNyK9dden+Guk8QW3lwwGMLo/tYj
	 o+WUQmPeoWr5w==
Received: from [192.168.68.112] (ppp118-210-89-8.adl-adc-lon-bras32.tpg.internode.on.net [118.210.89.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A315B650D6;
	Thu, 12 Sep 2024 10:40:31 +0800 (AWST)
Message-ID: <354f8d1c5ef517337c9f9a74e70580a8d97fc159.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/4] soc: aspeed: Simplify code with dev_err_probe()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Zhang Zekun <zhangzekun11@huawei.com>, andersson@kernel.org, 
	konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, joel@jms.id.au, 
	linux-aspeed@lists.ozlabs.org
Date: Thu, 12 Sep 2024 12:10:30 +0930
In-Reply-To: <20240909122921.12627-3-zhangzekun11@huawei.com>
References: <20240909122921.12627-1-zhangzekun11@huawei.com>
	 <20240909122921.12627-3-zhangzekun11@huawei.com>
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
Cc: chenjun102@huawei.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 2024-09-09 at 20:29 +0800, Zhang Zekun wrote:
> Use dev_err_probe() directly in the driver probe phase, and we
> don't need to judge if the error code is not equal to -EPROBE_DEFER.
> This can simplify the code a bit.
>=20
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

