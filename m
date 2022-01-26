Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 894A049CF32
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jan 2022 17:07:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JkTBt0qCRz3bSk
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jan 2022 03:07:34 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=netrider.rowland.org (client-ip=192.131.102.5;
 helo=netrider.rowland.org; envelope-from=stern+61f2c370@netrider.rowland.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 397 seconds by postgrey-1.36 at boromir;
 Thu, 27 Jan 2022 03:07:26 AEDT
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by lists.ozlabs.org (Postfix) with SMTP id 4JkTBl024Lz30Mg
 for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jan 2022 03:07:26 +1100 (AEDT)
Received: (qmail 141403 invoked by uid 1000); 26 Jan 2022 11:00:44 -0500
Date: Wed, 26 Jan 2022 11:00:44 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH] usb: gadget: mass_storage: add READ_TOC cmd mask check
Message-ID: <YfFwLDLX5D4dYLTb@rowland.harvard.edu>
References: <20220126100856.3680716-1-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126100856.3680716-1-neal_liu@aspeedtech.com>
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Felipe Balbi <balbi@kernel.org>, linux-aspeed@lists.ozlabs.org,
 BMC-SW@aspeedtech.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wesley Cheng <quic_wcheng@quicinc.com>, Cai Huoqing <caihuoqing@baidu.com>,
 Chen Lin <chen.lin5@zte.com.cn>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jan 26, 2022 at 06:08:56PM +0800, Neal Liu wrote:
> READ_TOC cmnd[2] specifies Format Field which is defined
> in SCSI-3 spec. Add command mask to avoid marking this
> sense data as invalid.
> 
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> ---
>  drivers/usb/gadget/function/f_mass_storage.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index 46dd11dcb3a8..14d51695b8ae 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -1944,7 +1944,7 @@ static int do_scsi_command(struct fsg_common *common)
>  		common->data_size_from_cmnd =
>  			get_unaligned_be16(&common->cmnd[7]);
>  		reply = check_command(common, 10, DATA_DIR_TO_HOST,
> -				      (7<<6) | (1<<1), 1,
> +				      (7<<6) | (1<<1) | (1<<2), 1,
>  				      "READ TOC");
>  		if (reply == 0)
>  			reply = do_read_toc(common, bh);

You've been anticipated:

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-testing&id=89ada0fe669a7abf8777b793b874202a0767a24f

Alan Stern
