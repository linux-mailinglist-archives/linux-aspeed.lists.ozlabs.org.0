Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1978A524D7
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2019 09:32:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XyXz4VBqzDqNx
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2019 17:32:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="QSQEnRsK"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XyWN741lzDqGM
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2019 17:30:56 +1000 (AEST)
Received: from localhost (f4.8f.5177.ip4.static.sl-reverse.com
 [119.81.143.244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 954C720652;
 Tue, 25 Jun 2019 07:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561447855;
 bh=qOPMdAefONiiQtGyOnVHuNOQa95t20MqHBIrIkRKEUE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QSQEnRsKS6ZadDbgY0eboH0YIJh21cGvWvGF2pMUwxQiFDuUq6eISTrpthg6uIoUZ
 diWOwIoFZt7rST1C3aIR7UZ3yhcoTKhABAjNY1CEdfIi1g5E/6a8kMSr2jB2iZVwGd
 48TdJfAWfbZ3qIHVtbPKg9UkpWY/ZnN50vuW3lRc=
Date: Tue, 25 Jun 2019 15:27:15 +0800
From: Greg KH <gregkh@linuxfoundation.org>
To: sudheer v <open.sudheer@gmail.com>
Subject: Re: [patch 0/5] *** DMA based UART driver for AST2500 ***
Message-ID: <20190625072715.GB18197@kroah.com>
References: <1561115855-4186-1-git-send-email-open.sudheer@gmail.com>
 <20190621131729.GA9997@kroah.com>
 <CAE-5=DTdo4qDUPRw+Giu=bCcpqu7EdLDt5ddDvqLSgGbuqE1Fg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-5=DTdo4qDUPRw+Giu=bCcpqu7EdLDt5ddDvqLSgGbuqE1Fg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Sudheer V <sudheer.veliseti@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 Shiva shankar <shivahshankar@gmail.com>, linux-kernel@vger.kernel.org,
 ShivahShankar Shakarnarayan rao
 <shivahshankar.shankarnarayanrao@aspeedtech.com>,
 Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, sudheer veliseti <sudheer.open@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Jun 25, 2019 at 10:30:32AM +0530, sudheer v wrote:
> Hi Greg,
> When i last submitted patches, i have not added change-logs.
> and also used custom debugs instead of kernel dynamic debugs.
> So i have resubmitted the patches , considering you have discarded old set.
> I want to send any changes suggested  from now on wards  with versioning
> V1,V2...so on.
> Is this acceptable for you? or should i submit the patches again as V1 once
> again.?

No, please resend now as a v3 series, with the information that says
what you changed from the previous versions.

thanks,

greg k-h
