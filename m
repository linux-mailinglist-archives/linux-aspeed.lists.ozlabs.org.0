Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B13622EF4EA
	for <lists+linux-aspeed@lfdr.de>; Fri,  8 Jan 2021 16:35:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DC6d66ffwzDr7n
	for <lists+linux-aspeed@lfdr.de>; Sat,  9 Jan 2021 02:35:54 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22d;
 helo=mail-oi1-x22d.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=n7ivfy5h; dkim-atps=neutral
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DC6d05rZdzDqMm
 for <linux-aspeed@lists.ozlabs.org>; Sat,  9 Jan 2021 02:35:44 +1100 (AEDT)
Received: by mail-oi1-x22d.google.com with SMTP id f132so11673650oib.12
 for <linux-aspeed@lists.ozlabs.org>; Fri, 08 Jan 2021 07:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=E4hL7hWcJ0igfc+aprwTRBAGfuL3tVmM1sjATNEeJmI=;
 b=n7ivfy5hnhGlJvSeEfjANiE7+AkBwa7ioS+TB06FeVrOlM9DwA8eDFXypB03vli0rN
 mggURhyf9hRt5mVb7qfhRCIr3EdKpRPUrfVQWJsnCV7H+ZSMNE9u1C9b5AhON59g4MpQ
 lZ0H5+GIfomikcf2SalIo0qSZyIJte7rRI9ovHKiHUi/9sUmfb/6WaZMBY08YeGn24sG
 Wp+qqC/fNyqT5cmOzYd6P59ydaMjw7Vza4k3rUvb+QgTugAthdw9djr1yik/r5/h2dXK
 SsOGTtaTgk3oPV02go+gzCsOXu0uXl3sy9nRQ82HAa1OnDLQtZqlkgNiM5CdvW+nyW5J
 6IxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=E4hL7hWcJ0igfc+aprwTRBAGfuL3tVmM1sjATNEeJmI=;
 b=U9dxCDY7LeWUNIqZbDeDv7KHZmDeIXf/8MUxTP86blqCbqGCWXhLN7r+CcyvgMjlm3
 zxZ4EKF9TKlQ5u5ZTSDgwT6PubExWqEScqu7+WnWmtpxV4r28cBEIVrozXDqi75uZek7
 Lq9d7SSZO9c++g6MwHxPtvTT3pX6C/AtZ7UbGNGZdoATbmjxXmGiLo3QB63+b2rqLvDp
 e2vCjBhkd8+4NtORXdDt+evEK5S22ySE4rWpRSFcOHEgYjbfnu7vnnORek12WYOutc3Q
 hSZubUXim1AYGhtCzGj5sPoav5/Qv2ybKxEMqT4jp3CssUxEYdz4oBl/5/wjHfn8on2+
 VuGw==
X-Gm-Message-State: AOAM530z087fRzjLbA+H2mum1XVxTpuSGlXAHTJ1DRHvh4GW6LQZxJF0
 U1E7jRyCs/FplR3q0yZNp/0=
X-Google-Smtp-Source: ABdhPJzpE80NZSOUeH07BSFeQYPeOpmC10QBlc8FwQrGc+bk5gEFTSavaasmTfYyfnvomlRbO7kZ4Q==
X-Received: by 2002:aca:bf54:: with SMTP id p81mr2727456oif.86.1610120141871; 
 Fri, 08 Jan 2021 07:35:41 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id l134sm2014219oig.25.2021.01.08.07.35.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 08 Jan 2021 07:35:41 -0800 (PST)
Date: Fri, 8 Jan 2021 07:35:40 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] hwmon: (aspeed-pwm-tacho): Switch to using the new API
 kobj_to_dev()
Message-ID: <20210108153540.GA4766@roeck-us.net>
References: <1609725945-13895-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609725945-13895-1-git-send-email-tiantao6@hisilicon.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
 linux-aspeed@lists.ozlabs.org, p.zabel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Jan 04, 2021 at 10:05:45AM +0800, Tian Tao wrote:
> fixed the following coccicheck:
> drivers/hwmon/aspeed-pwm-tacho.c:634:60-61: WARNING opportunity for
> kobj_to_dev()
> drivers/hwmon/aspeed-pwm-tacho.c:623:60-61: WARNING opportunity for
> kobj_to_dev()
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Acked-by: Joel Stanley <joel@jms.id.au>

Applied.

Thanks,
Guenter
