Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B9C9154C7
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Jun 2024 18:49:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Kkl8d41X;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7DTb0fkVz2ytN
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 02:49:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Kkl8d41X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7DTV5Yqnz2ysX
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 02:49:50 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A34460DFF
	for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Jun 2024 16:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D47C8C32782
	for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Jun 2024 16:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719247789;
	bh=+Bra0RkgrfLsP5dCznByNggwiEedk6z502yzyiYly4w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Kkl8d41XOwb9BjhSgBGRLCQCfLDAuvg3Hm7CYMeIkzBdAjG2iBgyElxV2L1yM2Wnq
	 Kb+kNk4vAq3PSuTpYYD/3167N53SPw8w9/DMSgFKotWWUVz2P0vBQD7qnf2/uEQ+ZL
	 +Gi62HzRYlm5czV6AsqqaMZONPbhJPQB/NkgKnlXiwDwuyu+uz/ghMobcGFzfVmifh
	 NoUIvxEbXLoChAnbhwkYh82L/hj/pzPT88Lx4cHafYT5MooH1haDbmA2U+bvhKcBw0
	 9PXjebkliKQgNRUm32rNjDDBZDBCs6Z7qwspM9HcOn1LGiw2ToJwsq3znNXA2WV7FV
	 HeGuOa3GyraBw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52cecba8d11so71959e87.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Jun 2024 09:49:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXDhaoqEyJf5T3dVxU+YIGlbJA1EnhJdRTn9wwKC7F+4RiYc9Xo5LeMaZDJDvv5amgitUsWJxXZN7SsTcew7vbPH8Xkf8ChhyZd4W2S4A==
X-Gm-Message-State: AOJu0YxOtYEHiDLAGQNhspvokyxmdJFBoeUh+0QC9dOv+KeusLPVmrag
	S4wARAxmW5lqyn8uA4AusSrCUpFlDJVcjpUyUCqvpFb7WuNOX7+bmYv1f/572OU10RQwONqbjuJ
	GmF8vDQ+G1mL4YqxdUIy0eB4Bbw==
X-Google-Smtp-Source: AGHT+IG0pBeW8ebE64VNR8DbL8ZdFf3AuTbc+Rvh/5EBZWs+PPolPm48g7EKW1XADebn7CulWGPww1Kogwh3acIjYUs=
X-Received: by 2002:a19:7518:0:b0:52c:da8c:fdf3 with SMTP id
 2adb3069b0e04-52ce183503emr2724071e87.17.1719247788246; Mon, 24 Jun 2024
 09:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240531193115.3814887-1-robh@kernel.org> <CACPK8Xes5vp+3YpQ3L5ix=LaDv7oWtqGFVc8moQf4D+o3rnLjg@mail.gmail.com>
 <8dabf3d1-2d23-4adc-a804-2b7aa5fe16e9@kernel.org>
In-Reply-To: <8dabf3d1-2d23-4adc-a804-2b7aa5fe16e9@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 24 Jun 2024 10:49:34 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+L6tKw+OzYVHSyou3eW5s7OChEbwqPe=qtQkRW=B+y-w@mail.gmail.com>
Message-ID: <CAL_Jsq+L6tKw+OzYVHSyou3eW5s7OChEbwqPe=qtQkRW=B+y-w@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: aspeed: Use standard 'i2c' bus node name
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, Jun 23, 2024 at 10:47=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 24/06/2024 03:55, Joel Stanley wrote:
> > On Sat, 1 Jun 2024 at 05:01, Rob Herring (Arm) <robh@kernel.org> wrote:
> >>
> >> The standard node name for I2C buses is 'i2c'.
> >
> > Unfortunately this can't be merged, as it will break userspace. There
> > is a lot of code out there that looks up devices based on the device
> > tree node path:
> >
> > https://github.com/openbmc/phosphor-state-manager/blob/3c1351cc2b631788=
76ef68f4107c9804d2e17dcc/meson.options#L140
>
> Eh, thanks for sharing.
>
> That's totally stupid user-space. The sysfs path to /sys/devices, or
> some grep by compatible, would be fine, but iterating over firmware/DT
> is just wrong.

Agreed, but Greg (and maybe it is actually documented somewhere) will
tell you that /sys/devices or /sys/bus/ paths are not ABI. /sys/class
is the ABI path.

Rob
